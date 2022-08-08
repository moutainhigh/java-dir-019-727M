package com.example.yang.richeditor.span;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.support.annotation.NonNull;
import android.view.View;

import com.example.yang.richeditor.RichEditText;
import com.example.yang.richeditor.callback.OnImageClickListener;
import com.example.yang.richeditor.model.BlockImageSpanVm;

/**
 * Title: 段落ImageSpan
 * Description: 如图片、视频封面、以及自定义布局等，支持响应短按和长按事件
 *
 * @author yangzhengqiang
 * @version 2019-04-29
 */
public class BlockImageSpan extends CenterImageSpan implements LongClickableSpan {

    // 手指触摸到图片左侧之后，当成光标移动到左侧，不响应图片点击事件
    private static final int TOUCH_OFFSET_X = 45;

    private float x;
    private float y;

    private BlockImageSpanVm blockImageSpanVm;

    private OnImageClickListener mOnImageClickListener;

    public BlockImageSpan(Context context, int resourceId, @NonNull BlockImageSpanVm blockImageSpanVm) {
        super(context, resourceId);
        initData(blockImageSpanVm);
    }

    public BlockImageSpan(Context context, Bitmap bitmap, @NonNull BlockImageSpanVm blockImageSpanVm) {
        super(context, bitmap);
        initData(blockImageSpanVm);
    }

    public BlockImageSpan(Drawable drawable, @NonNull BlockImageSpanVm blockImageSpanVm) {
        super(drawable);
        initData(blockImageSpanVm);
    }

    private void initData(@NonNull BlockImageSpanVm blockImageSpanVm) {
        this.blockImageSpanVm = blockImageSpanVm;
    }

    public void setOnClickListener(OnImageClickListener onImageClickListener) {
        mOnImageClickListener = onImageClickListener;
    }

    public BlockImageSpanVm getBlockImageSpanVm() {
        return blockImageSpanVm;
    }

    @Override
    public void onClick(View widget) {
        if (mOnImageClickListener != null) {
            mOnImageClickListener.onClick(this);
        }
    }

    @Override
    public void draw(Canvas canvas, CharSequence text, int start, int end, float x, int top, int y, int bottom, Paint paint) {
        super.draw(canvas, text, start, end, x, top, y, bottom, paint);
        this.x = x;
        this.y = top;
    }

    public boolean clicked(int touchX, int touchY) {
        Drawable drawable = getDrawable();
        if (drawable != null) {
            Rect rect = drawable.getBounds();
            return touchX <= rect.right + x && touchX >= rect.left + x + TOUCH_OFFSET_X
                    && touchY <= rect.bottom + y && touchY >= rect.top + y;
        }
        return false;
    }

    @Override
    public Drawable getDrawable() {
        Drawable drawable = super.getDrawable();
        int width = drawable.getIntrinsicWidth();
        int height = drawable.getIntrinsicHeight();
        int maxWidth = RichEditText.gRichEditTextWidthWithoutPadding;

        // 防止drawable宽度过大，超过编辑器的宽度
        if (width > maxWidth) {
            float scale = ((float) maxWidth / width);
            drawable.setBounds(0, 0, maxWidth, (int) (height * scale));
        }

        return drawable;
    }

}