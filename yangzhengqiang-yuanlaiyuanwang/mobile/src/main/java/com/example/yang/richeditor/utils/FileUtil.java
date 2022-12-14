package com.example.yang.richeditor.utils;

import android.annotation.SuppressLint;
import android.content.ContentUris;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.os.Build;
import android.provider.DocumentsContract;
import android.provider.MediaStore;
import android.text.TextUtils;
import android.util.Log;
import android.webkit.MimeTypeMap;

import com.example.yang.richeditor.enumtype.FileTypeEnum;

import java.io.File;

/**
 * Title:
 * Description:
 *
 * @author yangzhengqiang
 * @version 2019-05-13
 */
public class FileUtil {

    private static final String TAG = "FileUtil";

    private static String getFileExtensionFromUrl(String url) {
        if (!TextUtils.isEmpty(url)) {
            int fragment = url.lastIndexOf('#');
            if (fragment > 0) {
                url = url.substring(0, fragment);
            }

            int query = url.lastIndexOf('?');
            if (query > 0) {
                url = url.substring(0, query);
            }

            int filenamePos = url.lastIndexOf('/');
            String filename =
                    0 <= filenamePos ? url.substring(filenamePos + 1) : url;

            if (!TextUtils.isEmpty(filename)) {
                int dotPos = filename.lastIndexOf('.');
                if (0 <= dotPos) {
                    return filename.substring(dotPos + 1);
                }
            }
        }

        return "";
    }

    public static String getFileType(String path) {
        if (TextUtils.isEmpty(path)) {
            return FileTypeEnum.STATIC_IMAGE;
        }

        String fileExtension = getFileExtensionFromUrl(path);
        String mimeType = MimeTypeMap.getSingleton().getMimeTypeFromExtension(fileExtension);

        if (TextUtils.isEmpty(mimeType)) {
            return FileTypeEnum.STATIC_IMAGE;
        }

        if (mimeType.contains("video")) {
            return FileTypeEnum.VIDEO;
        }

        if (mimeType.contains("gif")) {
            return FileTypeEnum.GIF;
        }

        if (mimeType.contains("image")) {
            return FileTypeEnum.STATIC_IMAGE;
        }

        if (mimeType.contains("audio")) {
            return FileTypeEnum.AUDIO;
        }

        return FileTypeEnum.STATIC_IMAGE;
    }

    public static String getFileType(File file) {
        if (file == null) {
            Log.e(TAG, "file is null");
            return FileTypeEnum.STATIC_IMAGE;
        }

        return getFileType(file.getAbsolutePath());
    }

    public static String getFileType(Context context, Uri uri) {
        if (uri == null) {
            Log.e(TAG, "uri is null");
            return FileTypeEnum.STATIC_IMAGE;
        }

        String path = getFileRealPath(context, uri);
        if (TextUtils.isEmpty(path)) {
            Log.e(TAG, "path is null");
            return FileTypeEnum.STATIC_IMAGE;
        }

        return getFileType(path);
    }

    /**
     * ????????????????????????
     *
     * @param context ?????????
     * @param uri     ??????uri
     * @return ??????????????????
     */
    public static String getFileRealPath(Context context, Uri uri) {
        if ("content".equalsIgnoreCase(uri.getScheme())) {
            int sdkVersion = Build.VERSION.SDK_INT;
            if (sdkVersion >= 19) { // api >= 19
                return getRealPathFromUriAboveApi19(context, uri);
            } else { // api < 19
                return getRealPathFromUriBelowAPI19(context, uri);
            }
        } else if ("file".equalsIgnoreCase(uri.getScheme())) {
            return uri.getPath();
        }

        return null;
    }

    /**
     * ??????api19??????(?????????api19),??????uri???????????????????????????
     *
     * @param context ???????????????
     * @param uri     ?????????Uri
     * @return ??????Uri?????????????????????, ????????????????????????????????????, ????????????null
     */
    private static String getRealPathFromUriBelowAPI19(Context context, Uri uri) {
        return getDataColumn(context, uri, null, null);
    }

    /**
     * ???????????????????????? _data ???????????????Uri?????????????????????
     *
     * @return
     */
    private static String getDataColumn(Context context, Uri uri, String selection, String[] selectionArgs) {
        String path = null;

        String[] projection = new String[]{MediaStore.Images.Media.DATA};
        Cursor cursor = null;
        try {
            cursor = context.getContentResolver().query(uri, projection, selection, selectionArgs, null);
            if (cursor != null && cursor.moveToFirst()) {
                int columnIndex = cursor.getColumnIndexOrThrow(projection[0]);
                path = cursor.getString(columnIndex);
            }
        } catch (Exception e) {
            if (cursor != null) {
                cursor.close();
            }
        }
        return path;
    }


    /**
     * ??????api19?????????,??????uri???????????????????????????
     *
     * @param context ???????????????
     * @param uri     ?????????Uri
     * @return ??????Uri?????????????????????, ????????????????????????????????????, ????????????null
     */
    @SuppressLint("NewApi")
    private static String getRealPathFromUriAboveApi19(Context context, Uri uri) {
        String filePath = null;
        if (DocumentsContract.isDocumentUri(context, uri)) {
            // ?????????document????????? uri, ?????????document id???????????????
            String documentId = DocumentsContract.getDocumentId(uri);
            if (isMediaDocument(uri)) { // MediaProvider
                // ??????':'??????
                String id = documentId.split(":")[1];

                String selection = MediaStore.Images.Media._ID + "=?";
                String[] selectionArgs = {id};
                filePath = getDataColumn(context, MediaStore.Images.Media.EXTERNAL_CONTENT_URI, selection, selectionArgs);
            } else if (isDownloadsDocument(uri)) { // DownloadsProvider
                Uri contentUri = ContentUris.withAppendedId(Uri.parse("content://downloads/public_downloads"), Long.valueOf(documentId));
                filePath = getDataColumn(context, contentUri, null, null);
            }
        } else if ("content".equalsIgnoreCase(uri.getScheme())) {
            // ????????? content ????????? Uri
            filePath = getDataColumn(context, uri, null, null);
        } else if ("file".equals(uri.getScheme())) {
            // ????????? file ????????? Uri,?????????????????????????????????
            filePath = uri.getPath();
        }
        return filePath;
    }

    /**
     * @param uri the Uri to check
     * @return Whether the Uri authority is MediaProvider
     */
    private static boolean isMediaDocument(Uri uri) {
        return "com.android.providers.media.documents".equals(uri.getAuthority());
    }

    /**
     * @param uri the Uri to check
     * @return Whether the Uri authority is DownloadsProvider
     */
    private static boolean isDownloadsDocument(Uri uri) {
        return "com.android.providers.downloads.documents".equals(uri.getAuthority());
    }

}
