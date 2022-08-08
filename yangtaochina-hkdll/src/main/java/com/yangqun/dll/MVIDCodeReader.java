package com.yangqun.dll;

import com.sun.jna.Native;
import com.sun.jna.NativeLong;
import com.sun.jna.Pointer;
import com.sun.jna.Structure;
import com.sun.jna.ptr.ByteByReference;
import com.sun.jna.ptr.FloatByReference;
import com.sun.jna.ptr.IntByReference;
import com.sun.jna.ptr.PointerByReference;
import com.sun.jna.win32.StdCallLibrary;

import java.nio.ByteBuffer;

/**
 * 由于 海康的工业相机 读卡器 没有提供Java版本，
 * 尝试提供Java版本的SDK
 */
public interface MVIDCodeReader extends StdCallLibrary {

    MVIDCodeReader INSTANCE = (MVIDCodeReader)Native.load("MVIDCodeReader",MVIDCodeReader.class);

    public static int MVID_MAX_XML_SYMBOLIC_NUM = 64;

    public static int MVID_MAX_CAM_NUM = 256;

    //TODO 未见文档对这些常量的定义
    public static int MVID_MAX_CODECHARATERLEN = 256;
    public static int MVID_MAX_CODENUM = 256;
    public static int MVID_MAX_EVENT_NAME_SIZE = 256;

    public static class MVID_CAM_ENUMVALUE extends Structure{
        public int nCurValue; // 当前值
        public int nSupportedNum; //数据的有效数据个数
        public int[] nSupportValue = new int[MVID_MAX_XML_SYMBOLIC_NUM];// 支持的枚举类型，每个数组表示一种类型，最大大小为64
        public int[] nReserved = new int[4];//保留的参数
    }

    public static class MVID_CAM_FLOATVALUE extends Structure{
        public float fCurValue;// 当前值
        public float fMax;//最大值
        public float fMin;//最小值
        public int[] nReserved = new int[4];// 保留
    }

    public static class MVID_CAM_INTVALUE_EX extends Structure{
        public NativeLong nCurValue; // 当前值
        public NativeLong nMax;//最大值
        public NativeLong nMin;// 最小值
        public NativeLong nInc; // 增量值
        public int[] nReserved = new int[16];//保留
    }

    public static class MVID_CAM_OUTPUT_INFO extends Structure{
        public MVID_IMAGE_INFO stImage; 
        public MVID_CODE_INFO_LIST stCodeList;
        public ByteBuffer pImageWaybill;
        public int nImageWaybillLen;
        public MVID_IMAGE_TYPE enWaybillImageType;
        public int[] nReserved = new int[31];

    }

    public static class MVID_CAM_STRINGVALUE extends Structure{
        public byte[] chCurValue = new byte[256];
        public NativeLong nMaxLength;
        public int[] nReserved = new int[2];
    }

    public static class MVID_CAMERA_INFO extends Structure{
        public int nCamType;
        public byte[] chManufacturerName = new byte[32];
        public byte[] chModelName = new byte[32];
        public byte[] chDeviceVersion = new byte[32];
        public byte[] chManufacturerSpecificInfo = new byte[48];
        public byte[] chSerialNumber = new byte[16];
        public byte[] chUserDefinedName = new byte[16];
        public int nMacAddrHigh;
        public int nMacAddrLow;
        public int[] nCommomReaserved = new int[8];

        // 网口相机属性
        public int nCurrentIp;
        public int nNetExport;
        public int[] nGigEReserved = new int[32];

        // U口相机属性
        public byte CrtlInEndPoint;
        public byte CrtlOutEndPoint;
        public byte StreamEndPoint;
        public byte EventEndPoint;
        public short idVendor;
        public short idProduct;
        public int nDeviceNumber;
        public int[] nUsbReserved = new int[31];


        // 是否为指定系列型号相机    // ture - 指定系列型号相机  false - 非指定系列型号相机
        public boolean bSelectDevice;

        // 保留字节
        public int[] nReserved = new int[63];
    }

    public static class MVID_CAMERA_INFO_LIST extends Structure{
        public int nCamNum;
        public MVID_CAMERA_INFO[] pstCamInfo = new MVID_CAMERA_INFO[MVID_MAX_CAM_NUM];
    }

    enum MVID_CODE_FLAG {
        MVID_CODE_CORRECT,
        MVID_CODE_FILTERED;
    }

    public static class MVID_CODE_INFO extends Structure{
        public byte[] strCode = new byte[MVID_MAX_CODECHARATERLEN];
        public int nLen;
        public MVID_CODE_TYPE enBarType;
        public MVID_POINT_I[] stCornerPt = new MVID_POINT_I[4];
        public int nAngle;
        public int nFilterFlag;
        public int[] nReserved = new int[31];
    }

    public static class MVID_CODE_INFO_LIST extends Structure{
        public int nCodeNum;
        public MVID_CODE_INFO[] stCodeInfo = new MVID_CODE_INFO[MVID_MAX_CODENUM];
        public int[] nReserved = new int[32];

    }

    enum MVID_CODE_TYPE{

        MVID_CODE_NONE(0),

        //二维码
        MVID_CODE_TDCR_DM(1),
        MVID_CODE_TDCR_QR (2),
        // 一维码
        MVID_CODE_BCR_EAN8(8),
        MVID_CODE_BCR_UPCE(9),
        MVID_CODE_BCR_UPCA (12),
        MVID_CODE_BCR_EAN13(13),
        MVID_CODE_BCR_ISBN13(14),
        MVID_CODE_BCR_CODABAR(20),
        MVID_CODE_BCR_ITF25(25),
        MVID_CODE_BCR_CODE39(39),
        MVID_CODE_BCR_CODE93(93),
        MVID_CODE_BCR_CODE128(128);
        public final int value;
        MVID_CODE_TYPE(int value){
            this.value = value;
        }
    }

    public class MVID_CR_CAM_INTVALUE extends Structure{
        public int nCurValue;
        public int nMax;
        public int nMin;
        public int nInc;
        public int[] nReserved = new int[4];
    }

    public class MVID_EVENT_OUT_INFO extends Structure{
        public byte[] EventName = new byte[MVID_MAX_EVENT_NAME_SIZE];
        public short nEventID;
        public short nStreamChannel;
        public int nBlockIdHigh;
        public int nBlockIdLow;
        public int nTimestampHigh;
        public int nTimestampLow;
        public IntByReference pEventData;
        public int nEventDataSize;
        public int[] nReserved = new int[16];
    }

    public class MVID_IMAGE_INFO extends Structure{
        public ByteByReference pImageBuf;
        public int nImageLen;
        MVID_IMAGE_TYPE enImageType;
        public short nWidth;
        public short nHeight;
        public int nFrameNum;
        public int nDevTimeStampHigh;
        public int nDevTimeStampLow;
        public int[] nReserved = new int[32];

    }

    enum MVID_IMAGE_TYPE{
        MVID_IMAGE_Undefined,
        MVID_IMAGE_MONO8,
        MVID_IMAGE_JPEG ,
        MVID_IMAGE_BMP ,
        MVID_IMAGE_RGB24 ,
        MVID_IMAGE_BGR24 ,
        MVID_IMAGE_MONO10,
        MVID_IMAGE_MONO10_Packed ,
        MVID_IMAGE_MONO12 ,
        MVID_IMAGE_MONO12_Packed ,
        MVID_IMAGE_MONO16 ,
        MVID_IMAGE_BayerGR8 ,
        MVID_IMAGE_BayerRG8,
        MVID_IMAGE_BayerGB8 ,
        MVID_IMAGE_BayerBG8 ,
        MVID_IMAGE_BayerGR10,
        MVID_IMAGE_BayerRG10 ,
        MVID_IMAGE_BayerGB10 ,
        MVID_IMAGE_BayerBG10 ,
        MVID_IMAGE_BayerGR12,
        MVID_IMAGE_BayerRG12,
        MVID_IMAGE_BayerGB12 ,
        MVID_IMAGE_BayerBG12,
        MVID_IMAGE_BayerGR10_Packed ,
        MVID_IMAGE_BayerRG10_Packed ,
        MVID_IMAGE_BayerGB10_Packed,
        MVID_IMAGE_BayerBG10_Packed,
        MVID_IMAGE_BayerGR12_Packed,
        MVID_IMAGE_BayerRG12_Packed ,
        MVID_IMAGE_BayerGB12_Packed ,
        MVID_IMAGE_BayerBG12_Packed ,
        MVID_IMAGE_YUV422_Packed,
        MVID_IMAGE_YUV422_YUYV_Packed,
        MVID_IMAGE_RGB8_Packed ,
        MVID_IMAGE_BGR8_Packed ,
        MVID_IMAGE_RGBA8_Packed ,
        MVID_IMAGE_BGRA8_Packed ;
    }

    public class MVID_POINT_I extends Structure{
        public int nX;
        public int nY;
    }

    public class MVID_PROC_PARAM extends Structure{
        public ByteBuffer pImageBuf;
        public int nImageLen;
        public MVID_IMAGE_TYPE enImageType;
        public short nWidth;
        public short nHeight;
        public MVID_CODE_INFO_LIST stCodeList;
        public ByteByReference pImageWaybill;
        public int nImageWaybillLen;
        public int[] nReserved = new int[31];
    }

    enum MVID_IMAGE_OUTPUT_MODE{
        MVID_OUTPUT_NORMAL,
        MVID_OUTPUT_RAW;
    }
    //SDK 版本信息
    int MVID_CR_GetVersion(String chVersion);
    //相机初始化及销毁
    int MVID_CR_CreateHandle(PointerByReference handle, int nCodeAbility);
    int MVID_CR_DestroyHandle(Pointer handle);
    //相机参数设置
    int MVID_CR_CAM_SetIntValue(Pointer handle, String strKey, NativeLong nValue);
    int MVID_CR_CAM_GetIntValue(Pointer handle, String strKey, MVID_CAM_INTVALUE_EX pIntValue);
    int MVID_CR_CAM_SetStringValue(Pointer handle, String strKey, String sValue);
    int MVID_CR_CAM_GetStringValue(Pointer handle, String strKey, MVID_CAM_STRINGVALUE pStringValue);
    int MVID_CR_CAM_SetFloatValue(Pointer handle, String strKey, float fValue);
    int MVID_CR_CAM_GetFloatValue(Pointer handle, String strKey, MVID_CAM_FLOATVALUE pFloatValue);
    int MVID_CR_CAM_SetBoolValue(Pointer handle, String strKey, boolean pBoolValue);
    int MVID_CR_CAM_GetBoolValue(Pointer handle, String strKey, Boolean pBoolValue);
    int MVID_CR_CAM_SetCommandValue(Pointer handle, String strKey);
    int MVID_CR_CAM_SetEnumValue(Pointer handle, String strKey, int nValue);
    int MVID_CR_CAM_GetEnumValue(Pointer handle, String strKey, MVID_CAM_ENUMVALUE pEnumValue);
    int MVID_CR_CAM_SetEnumValueByString(Pointer handle, String strKey, String sValue);
    int MVID_CR_CAM_EnumDevices(MVID_CAMERA_INFO_LIST pstCamList);
    int MVID_CR_CAM_BindDevice(Pointer handle, MVID_CAMERA_INFO pstCamInfo);
    int MVID_CR_CAM_BindDeviceByIp(Pointer handle, String chCurrentIp, String chNetExport);
    int MVID_CR_CAM_BindDeviceBySerialNumber(Pointer handle, String chSerialNumber);
    //相机功能设置
    int MVID_CR_Process(Pointer handle, MVID_PROC_PARAM pstParam, int nCodeAbility);
    int MVID_CR_CAM_GetOneFrameTimeout(Pointer handle, MVID_CAM_OUTPUT_INFO pFrameInfo, int nMsec);
    public static interface cbException extends StdCallCallback{
        public void invoke(int nMsgType, Pointer pUser);
    }
    int MVID_CR_RegisterExceptionCallBack(Pointer handle, cbException cbException, Pointer pUser);
    int MVID_CR_RuleLoad(Pointer handle, String pFilePath);
    int MVID_CR_SaveImage(Pointer handle, MVID_IMAGE_INFO pstInputImage, MVID_IMAGE_TYPE enImageType, MVID_IMAGE_INFO pstOutputImage, int nJpgQuality);
    int MVID_CR_ScriptLoad(Pointer handle, String pFilePath, String pFuncName);
    int MVID_CR_CAM_StartGrabbing(Pointer handle);
    int MVID_CR_CAM_StopGrabbing(Pointer handle);
    public static interface cbOutput extends StdCallCallback{
        public void invoke(MVID_CAM_OUTPUT_INFO pstOutput, Pointer pUser);
    }
    int MVID_CR_CAM_RegisterImageCallBack(Pointer handle, cbOutput cbOutput, Pointer pUser);
    public static interface cbPreOutput extends StdCallCallback{
        public void invoke(MVID_IMAGE_INFO pstPreOutput, MVID_IMAGE_INFO pstProcInput, Pointer pUser);
    }
    int MVID_CR_CAM_RegisterPreImageCallBack(Pointer handle, cbPreOutput cbPreOutput, Pointer pUser);
    public static interface cbEvent extends StdCallCallback{
        public void invoke(MVID_EVENT_OUT_INFO pEventInfo, Pointer pUser);
    }
    int MVID_CR_CAM_RegisterAllEventCallBack(Pointer handle, cbEvent cbEvent, Pointer pUser);
    int MVID_CR_CAM_EnumDevicesByCfg(MVID_CAMERA_INFO_LIST pstCamList);
    int MVID_CR_CAM_SetImageNodeNum(Pointer handle, int num);
    int MVID_CR_CAM_SetImageOutPutMode(Pointer handle, MVID_IMAGE_OUTPUT_MODE enImageOutPutMode);
    int MVID_CR_CAM_GetImageBuffer(Pointer handle, MVID_IMAGE_INFO pImageInfo, int nMsec);
    public static interface cbOutput2  extends StdCallCallback{
        public void invoke(MVID_IMAGE_INFO pstOutput, Pointer pUser);
    }
    int MVID_CR_CAM_RegisterImageBufferCallBack(Pointer handle, cbOutput2 cbOutput, Pointer pUser);
    //算法参数设置
    int MVID_CR_Algorithm_SetIntValue(Pointer handle, String strParamKeyName, int nValue);
    int MVID_CR_Algorithm_GetIntValue(Pointer handle, String strParamKeyName, IntByReference pnValue);
    int MVID_CR_Algorithm_SetStringValue(Pointer handle, String strParamKeyName, String strValue);
    int MVID_CR_Algorithm_GetStringValue(Pointer handle, String strParamKeyName, ByteBuffer strValue);
    int MVID_CR_Algorithm_SetFloatValue(Pointer handle, String strParamKeyName, float fValue);
    int MVID_CR_Algorithm_GetFloatValue(Pointer handle, String strParamKeyName, FloatByReference pfValue);

}
