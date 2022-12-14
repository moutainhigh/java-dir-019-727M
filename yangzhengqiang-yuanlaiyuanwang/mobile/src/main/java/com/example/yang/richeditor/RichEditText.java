package com.example.yang.richeditor;

import android.app.Activity;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.media.ThumbnailUtils;
import android.net.Uri;
import android.provider.MediaStore;
import android.support.annotation.DrawableRes;
import android.support.annotation.NonNull;
import android.support.v7.content.res.AppCompatResources;
import android.text.Editable;
import android.text.SpannableString;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputConnection;
import android.widget.ImageView;
import android.widget.TextView;

import com.example.yang.myapplication.R;
import com.example.yang.richeditor.callback.OnImageClickListener;
import com.example.yang.richeditor.config.AppConfig;
import com.example.yang.richeditor.enumtype.FileTypeEnum;
import com.example.yang.richeditor.enumtype.ImageTypeMarkEnum;
import com.example.yang.richeditor.enumtype.RichTypeEnum;
import com.example.yang.richeditor.ext.LongClickableLinkMovementMethod;
import com.example.yang.richeditor.model.BlockImageSpanVm;
import com.example.yang.richeditor.model.RichEditorBlock;
import com.example.yang.richeditor.model.StyleBtnVm;
import com.example.yang.richeditor.span.BlockImageSpan;
import com.example.yang.richeditor.utils.BitmapUtil;
import com.example.yang.richeditor.utils.ClipboardUtil;
import com.example.yang.richeditor.utils.FileUtil;
import com.example.yang.richeditor.utils.ViewUtil;
import com.example.yang.richeditor.utils.WindowUtil;
import com.hanks.lineheightedittext.LineHeightEditText;
import com.makeramen.roundedimageview.RoundedImageView;

import java.io.File;
import java.io.InputStream;
import java.util.List;

import ren.qinc.edit.PerformEdit;

/**
 * Title: ?????????EditText??????????????????????????????
 * Description:
 *
 * @author yangzhengqiang
 * @version 2019-04-29
 */
public class RichEditText extends LineHeightEditText {

    private static final String TAG = "RichEditText";

    // ????????????????????????ImageSpan???????????????????????????????????????ImageSpan??????????????????????????????????????????
    private static final int IMAGE_SPAN_MINUS_VALUE = 6;

    private int imageSpanPaddingTop;
    private int imageSpanPaddingBottom;
    private int imageSpanPaddingLeft;
    private int imageSpanPaddingRight;
    // ?????????????????????????????????
    private int internalImageMaxHeight;

    // ????????????????????????
    private boolean gIsShowVideoMark;
    // ????????????????????????id
    private int gVideoMarkResourceId;

    // ????????????gif??????
    private boolean gIsShowGifMark;
    // ????????????????????????
    private boolean gIsShowLongImageMark;

    // ????????????????????????????????????
    private int gImageRadius;

    private int screenWidth;

    // ??????????????????
    private int gHeadlineTextSize;

    /**
     * EditText?????????
     */
    public static int gRichEditTextWidthWithoutPadding;

    private RichInputConnectionWrapper mRichInputConnection;

    private Context mContext;

    private RichUtils mRichUtils;

    private PerformEdit performEdit;

    public interface OnSelectionChangedListener {
        /**
         * ????????????????????????
         *
         * @param curPos ??????????????????
         */
        void onChange(int curPos);
    }

    /**
     * EditText???????????????????????????????????????????????????
     */
    public interface IClipCallback {
        /**
         * ????????????
         */
        void onCut();

        /**
         * ????????????
         */
        void onCopy();

        /**
         * ????????????
         */
        void onPaste();
    }

    /**
     * ???????????????????????????
     */
    private OnSelectionChangedListener mOnSelectionChangedListener;

    public RichEditText(Context context) {
        super(context);
        init(context, null);
    }

    public RichEditText(Context context, AttributeSet attrs) {
        super(context, attrs);
        init(context, attrs);
    }

    public RichEditText(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        init(context, attrs);
    }

    private void init(Context context, AttributeSet attrs) {
        if (attrs != null) {
            TypedArray ta = context.obtainStyledAttributes(attrs, R.styleable.RichEditText);
            gIsShowVideoMark = ta.getBoolean(R.styleable.RichEditText_editor_show_video_mark, true);
            gVideoMarkResourceId = ta.getResourceId(R.styleable.RichEditText_editor_video_mark_resource_id, R.drawable.default_video_icon);
            gIsShowGifMark = ta.getBoolean(R.styleable.RichEditText_editor_show_gif_mark, true);
            gIsShowLongImageMark = ta.getBoolean(R.styleable.RichEditText_editor_show_long_image_mark, true);

            DisplayMetrics dm = context.getResources().getDisplayMetrics();
            gImageRadius = (int) ta.getDimension(R.styleable.RichEditText_editor_image_radius, 0);

            float defHeadlineTextSize = context.getResources().getDimension(R.dimen.rich_editor_headline_text_size);
            gHeadlineTextSize = (int) ta.getDimension(R.styleable.RichEditText_editor_headline_text_size, defHeadlineTextSize);

            ta.recycle();
        }

        mContext = context;
        imageSpanPaddingTop = (int) mContext.getResources().getDimension(R.dimen.rich_editor_image_span_padding_top);
        imageSpanPaddingBottom = (int) mContext.getResources().getDimension(R.dimen.rich_editor_image_span_padding_bottom);
        imageSpanPaddingLeft = (int) mContext.getResources().getDimension(R.dimen.rich_editor_image_span_padding_left);
        imageSpanPaddingRight = (int) mContext.getResources().getDimension(R.dimen.rich_editor_image_span_padding_right);
        internalImageMaxHeight = (int) mContext.getResources().getDimension(R.dimen.rich_editor_image_max_height);

        mRichInputConnection = new RichInputConnectionWrapper(null, true);
        setMovementMethod(new LongClickableLinkMovementMethod());
        requestFocus();
        setSelection(0);

        if (!(mContext instanceof Activity)) {
            Log.e(TAG, "context is not activity context!");
            return;
        }

        mRichUtils = new RichUtils((Activity) context, this);

        screenWidth = WindowUtil.getScreenSize(mContext)[0];

        performEdit = new PerformEdit(this);
    }

    public void undo() {
        performEdit.undo();
    }

    public void redo() {
        performEdit.redo();
    }

    private int getWidthWithoutPadding() {
        int editTextMeasureWidth = getMeasuredWidth();
        if (editTextMeasureWidth <= 0) {
            // ??????????????????????????????, ???????????????????????????????????????????????????
            editTextMeasureWidth = screenWidth;
        }
        return editTextMeasureWidth - getPaddingLeft() - getPaddingRight() - IMAGE_SPAN_MINUS_VALUE;
    }

    public void initStyleButton(StyleBtnVm styleBtnVm) {
        mRichUtils.initStyleButton(styleBtnVm);
    }

    /**
     * ????????????????????????
     */
    public void clearContent() {
        setText("");
        requestFocus();
        setSelection(0);
    }

    /**
     * ??????????????????(???????????????????????????????????????????????????????????????)
     * ??????????????????????????????
     *
     * @param richEditorBlock
     */
    public void insertBlockText(RichEditorBlock richEditorBlock) {
        SpannableString spanStringContent = new SpannableString(richEditorBlock.getText() + "\n");
        String blockType = richEditorBlock.getBlockType();
        switch (blockType) {
            case RichTypeEnum.BLOCK_NORMAL_TEXT:
                mRichUtils.insertNormalTextBlock(spanStringContent, richEditorBlock.getInlineStyleEntityList());
                break;
            case RichTypeEnum.BLOCK_HEADLINE:
            case RichTypeEnum.BLOCK_QUOTE:
                mRichUtils.insertBlockSpanText(blockType, spanStringContent, richEditorBlock.getInlineStyleEntityList());
                break;
        }
    }

    /**
     * ???????????????gif?????????????????????????????????
     *
     * @param imageItemView    ?????????????????????View
     * @param blockImageSpanVm ????????????
     */
    private void setMarkIconVisibility(View imageItemView, BlockImageSpanVm blockImageSpanVm) {
        ImageView ivVideoIcon = imageItemView.findViewById(R.id.ivVideoIcon);
        TextView tvGifOrLongImageMark = imageItemView.findViewById(R.id.tvGifOrLongImageMark);

        // ???????????????gif???????????????????????????????????????
        ivVideoIcon.setVisibility(GONE);
        tvGifOrLongImageMark.setVisibility(GONE);

        // ????????????
        if (blockImageSpanVm.isVideo() && gIsShowVideoMark && gVideoMarkResourceId != 0) {
            // ?????????????????????????????????
            Drawable videoIconDrawable = AppCompatResources.getDrawable(mContext, gVideoMarkResourceId);
            if (videoIconDrawable != null) {
                ivVideoIcon.setVisibility(VISIBLE);
                ivVideoIcon.setImageDrawable(videoIconDrawable);
                ViewGroup.LayoutParams layoutParams = ivVideoIcon.getLayoutParams();
                layoutParams.width = videoIconDrawable.getIntrinsicWidth();
                layoutParams.height = videoIconDrawable.getIntrinsicHeight();
            }
            return;
        }


        // ????????????
        if (blockImageSpanVm.isLong() && gIsShowLongImageMark) {
            // ???????????????????????????
            tvGifOrLongImageMark.setVisibility(VISIBLE);
            tvGifOrLongImageMark.setText(ImageTypeMarkEnum.LONG);
            return;
        }

        // ??????gif
        if (blockImageSpanVm.isGif() && gIsShowGifMark) {
            // gif, ??????gif??????
            tvGifOrLongImageMark.setVisibility(VISIBLE);
            tvGifOrLongImageMark.setText(ImageTypeMarkEnum.GIF);
        }
    }

    /**
     * ?????????blockImage??????????????????????????????????????????
     */
    private void removeSelectedContent() {
        Editable editable = getEditableText();
        int selectionStart = getSelectionStart();
        int selectionEnd = getSelectionEnd();

        if (selectionStart >= selectionEnd) {
            return;
        }

        editable.delete(selectionStart, selectionEnd);
    }

    public void insertBlockImage(Drawable drawable, @NonNull BlockImageSpanVm blockImageSpanVm,
                                 OnImageClickListener onImageClickListener) {
        if (!(mContext instanceof Activity)) {
            Log.e(TAG, "context is not activity context!");
            return;
        }

        removeSelectedContent();

        int originWidth = drawable.getIntrinsicWidth();
        int originHeight = drawable.getIntrinsicHeight();
        blockImageSpanVm.setLong(originHeight > originWidth * AppConfig.IMAGE_MAX_HEIGHT_WIDTH_RATIO);

        // ????????????????????????????????????????????????????????????Mate-10???ImageSpan??????????????????????????????????????????ImageSpan????????????????????????
        int editTextWidth = getWidthWithoutPadding();
        int imageWidth = blockImageSpanVm.getWidth();
        int resImageWidth = imageWidth > editTextWidth ? editTextWidth : imageWidth;
        int imageMaxHeight = blockImageSpanVm.getMaxHeight() > internalImageMaxHeight
                ? internalImageMaxHeight : blockImageSpanVm.getMaxHeight();
        int resImageHeight = (int) (originHeight * 1.0 / originWidth * resImageWidth);
        resImageHeight = resImageHeight > imageMaxHeight ? imageMaxHeight : resImageHeight;
        // ?????????????????????????????????????????????????????????2???
        double maxHeightWidthRadio = AppConfig.IMAGE_MAX_HEIGHT_WIDTH_RATIO;
        resImageHeight = resImageHeight > resImageWidth * maxHeightWidthRadio
                ? (int) (resImageWidth * maxHeightWidthRadio)
                : resImageHeight;

        Activity activity = (Activity) mContext;
        View imageItemView = activity.getLayoutInflater().inflate(R.layout.rich_editor_image, null);
        RoundedImageView imageView = imageItemView.findViewById(R.id.image);
        imageView.setImageDrawable(drawable);
        // ????????????
        imageView.setCornerRadius(gImageRadius);

        // ???????????????gif?????????????????????????????????
        setMarkIconVisibility(imageItemView, blockImageSpanVm);

        ViewGroup.LayoutParams layoutParams = imageView.getLayoutParams();
        layoutParams.width = resImageWidth;
        layoutParams.height = resImageHeight;

        ViewUtil.layoutView(
                imageItemView,
                resImageWidth + imageSpanPaddingLeft + imageSpanPaddingRight,
                resImageHeight + imageSpanPaddingTop + imageSpanPaddingBottom
        );

        BlockImageSpan blockImageSpan = new BlockImageSpan(mContext, ViewUtil.getBitmap(imageItemView), blockImageSpanVm);
        mRichUtils.insertBlockImageSpan(blockImageSpan);

        // ???????????????????????????
        blockImageSpan.setOnClickListener(onImageClickListener);
    }

    private void insertBlockImageInternal(Uri uri, @NonNull BlockImageSpanVm blockImageSpanVm,
                                          OnImageClickListener onImageClickListener) {
        if (uri == null) {
            Log.e(TAG, "uri is null");
            return;
        }

        try {
            InputStream is = mContext.getContentResolver().openInputStream(
                    uri);
            String filePath = FileUtil.getFileRealPath(mContext, uri);
            Bitmap resBitmap;
            int degree = BitmapUtil.readPictureDegree(filePath);
            if (degree > 0) {
                // ?????????????????????0????????????????????????
                resBitmap = BitmapUtil.rotateBitmap(degree, filePath);
            } else {
                resBitmap = BitmapFactory.decodeStream(is);
            }
            Drawable drawable = new BitmapDrawable(mContext.getResources(), resBitmap);
            drawable.setBounds(0, 0, drawable.getIntrinsicWidth(),
                    drawable.getIntrinsicHeight());
            is.close();
            insertBlockImage(drawable, blockImageSpanVm, onImageClickListener);
        } catch (Exception e) {
            Log.e(TAG, "Failed to loaded content " + uri, e);
        }
    }

    /**
     * ??????uri???????????????????????????
     *
     * @param uri                  ??????uri
     * @param blockImageSpanVm     ????????????
     * @param onImageClickListener ???????????????????????????
     */
    public void insertBlockImage(Uri uri, @NonNull BlockImageSpanVm blockImageSpanVm,
                                 OnImageClickListener onImageClickListener) {
        if (uri == null) {
            Log.e(TAG, "uri is null");
            return;
        }

        insertBlockImage(FileUtil.getFileRealPath(mContext, uri), blockImageSpanVm, onImageClickListener);
    }

    /**
     * ?????????????????????????????????????????????
     *
     * @param filePath             ??????(?????????)????????????????????? /storage/emulated/0/Pictures/17173/1553236560146.jpg
     * @param blockImageSpanVm     ????????????
     * @param onImageClickListener ???????????????????????????
     */
    public void insertBlockImage(String filePath, @NonNull BlockImageSpanVm blockImageSpanVm,
                                 OnImageClickListener onImageClickListener) {
        if (TextUtils.isEmpty(filePath)) {
            Log.e(TAG, "file path is empty");
            return;
        }

        String fileType = FileUtil.getFileType(filePath);
        switch (fileType) {
            case FileTypeEnum.VIDEO:
                Bitmap coverBitmap = ThumbnailUtils.createVideoThumbnail(filePath, MediaStore.Video.Thumbnails.MINI_KIND);
                blockImageSpanVm.setVideo(true);
                blockImageSpanVm.setGif(false);
                insertBlockImage(coverBitmap, blockImageSpanVm, onImageClickListener);
                break;
            case FileTypeEnum.STATIC_IMAGE:
            case FileTypeEnum.GIF:
                File file = new File(filePath);
                blockImageSpanVm.setVideo(false);
                if (FileTypeEnum.GIF.equals(fileType)) {
                    blockImageSpanVm.setGif(true);
                } else {
                    blockImageSpanVm.setGif(false);
                }
                // ??????uri???path????????????????????????????????????????????????????????????????????????
                blockImageSpanVm.setPhoto(true);
                insertBlockImageInternal(Uri.fromFile(file), blockImageSpanVm, onImageClickListener);
                break;
            default:
                Log.e(TAG, "file type is illegal");
                break;
        }
    }

    public void insertBlockImage(@DrawableRes int resourceId, @NonNull BlockImageSpanVm blockImageSpanVm,
                                 OnImageClickListener onImageClickListener) {
        try {
            Drawable drawable = AppCompatResources.getDrawable(mContext, resourceId);
            insertBlockImage(drawable, blockImageSpanVm, onImageClickListener);
        } catch (Exception e) {
            Log.e(TAG, "Unable to find resource: " + resourceId);
        }
    }

    public void insertBlockImage(Bitmap bitmap, @NonNull BlockImageSpanVm blockImageSpanVm,
                                 OnImageClickListener onImageClickListener) {
        Drawable drawable = mContext != null
                ? new BitmapDrawable(mContext.getResources(), bitmap)
                : new BitmapDrawable(bitmap);
        int width = drawable.getIntrinsicWidth();
        int height = drawable.getIntrinsicHeight();
        drawable.setBounds(0, 0, width > 0 ? width : 0, height > 0 ? height : 0);
        insertBlockImage(drawable, blockImageSpanVm, onImageClickListener);
    }

    /**
     * ???????????????????????????
     *
     * @return ???????????????
     */
    public List<RichEditorBlock> getContent() {
        return mRichUtils.getContent();
    }

    public RichUtils getRichUtils() {
        return mRichUtils;
    }

    @Override
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        gRichEditTextWidthWithoutPadding = getWidthWithoutPadding();
    }

    /**
     * ????????????????????????????????????
     *
     * @param backspaceListener ??????????????????????????????
     */
    protected void setBackspaceListener(RichInputConnectionWrapper.BackspaceListener backspaceListener) {
        mRichInputConnection.setBackspaceListener(backspaceListener);
    }

    /**
     * ???????????????????????????
     *
     * @param listener ???????????????????????????
     */
    protected void setOnSelectionChangedListener(OnSelectionChangedListener listener) {
        this.mOnSelectionChangedListener = listener;
    }

    @Override
    protected void onSelectionChanged(int selStart, int selEnd) {
        super.onSelectionChanged(selStart, selEnd);
        if (mOnSelectionChangedListener != null) {
            mOnSelectionChangedListener.onChange(selEnd);
        }
    }

    /**
     * ????????????
     */
    private void handlePaste() {
        int selectionStart = getSelectionStart();
        int selectionEnd = getSelectionEnd();
        Editable editable = getEditableText();
        editable.delete(selectionStart, selectionEnd);
        selectionStart = getSelectionStart();
        mRichUtils.insertStringIntoEditText(ClipboardUtil.getInstance(mContext).getClipboardText(), selectionStart);
    }

    @Override
    public boolean onTextContextMenuItem(int id) {
        switch (id) {
            case android.R.id.cut:
                if (mContext instanceof IClipCallback) {
                    ((IClipCallback) mContext).onCut();
                }
                break;
            case android.R.id.copy:
                Log.d(TAG, "getSelectionStart: " + getSelectionStart() + ", getSelectionEnd: " + getSelectionEnd());
                if (mContext instanceof IClipCallback) {
                    ((IClipCallback) mContext).onCopy();
                }
                break;
            case android.R.id.paste:
                if (mContext instanceof IClipCallback) {
                    ((IClipCallback) mContext).onPaste();
                }

                handlePaste();
                return true;
            default:
                break;
        }

        return super.onTextContextMenuItem(id);
    }

    /**
     * ???????????????EditText??????????????????????????????????????????????????????InputConnection???
     * ??????????????????????????????????????????????????????InputConnection????????????????????????????????????
     */
    @Override
    public InputConnection onCreateInputConnection(EditorInfo outAttrs) {
        mRichInputConnection.setTarget(super.onCreateInputConnection(outAttrs));
        return mRichInputConnection;
    }

    public int getVideoMarkResourceId() {
        return gVideoMarkResourceId;
    }

    public void setVideoMarkResourceId(int videoMarkResourceId) {
        this.gVideoMarkResourceId = videoMarkResourceId;
    }

    public boolean isShowVideoMark() {
        return gIsShowVideoMark;
    }

    public void setIsShowVideoMark(boolean isShowVideoMark) {
        this.gIsShowVideoMark = isShowVideoMark;
    }

    public boolean isShowGifMark() {
        return gIsShowGifMark;
    }

    public void setIsShowGifMark(boolean isShowGifMark) {
        this.gIsShowGifMark = isShowGifMark;
    }

    public boolean isShowLongImageMark() {
        return gIsShowLongImageMark;
    }

    public void setIsShowLongImageMark(boolean isShowLongImageMark) {
        this.gIsShowLongImageMark = isShowLongImageMark;
    }

    public int getHeadlineTextSize() {
        return gHeadlineTextSize;
    }

    public void setHeadlineTextSize(int headlineTextSize) {
        this.gHeadlineTextSize = headlineTextSize;
    }
}
