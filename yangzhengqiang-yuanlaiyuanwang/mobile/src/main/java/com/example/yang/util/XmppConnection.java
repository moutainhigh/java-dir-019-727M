package com.example.yang.util;

import android.annotation.TargetApi;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.hardware.SensorDirectChannel;
import android.os.Build;
import android.os.Handler;
import android.support.annotation.RequiresApi;
import android.util.Base64;
import android.util.Log;

import com.example.yang.myapplication.Login;

import org.jivesoftware.smack.ConnectionConfiguration;
import org.jivesoftware.smack.ConnectionListener;
import org.jivesoftware.smack.PacketListener;
import org.jivesoftware.smack.SmackConfiguration;
import org.jivesoftware.smack.SmackException;
import org.jivesoftware.smack.XMPPConnection;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smack.chat2.Chat;
import org.jivesoftware.smack.chat2.ChatManager;
import org.jivesoftware.smack.chat2.IncomingChatMessageListener;
import org.jivesoftware.smack.filter.AndFilter;
import org.jivesoftware.smack.filter.PacketFilter;
import org.jivesoftware.smack.filter.PacketIDFilter;
import org.jivesoftware.smack.filter.PacketTypeFilter;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.packet.Message;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smack.packet.Presence;
import org.jivesoftware.smack.provider.ProviderManager;
import org.jivesoftware.smack.roster.Roster;
import org.jivesoftware.smack.roster.RosterEntry;
import org.jivesoftware.smack.roster.RosterListener;
import org.jivesoftware.smack.roster.SubscribeListener;
import org.jivesoftware.smack.tcp.XMPPTCPConnection;
import org.jivesoftware.smack.tcp.XMPPTCPConnectionConfiguration;
import org.jivesoftware.smackx.filetransfer.FileTransfer;
import org.jivesoftware.smackx.filetransfer.FileTransferListener;
import org.jivesoftware.smackx.filetransfer.FileTransferManager;
import org.jivesoftware.smackx.filetransfer.FileTransferRequest;
import org.jivesoftware.smackx.filetransfer.IncomingFileTransfer;
import org.jivesoftware.smackx.filetransfer.OutgoingFileTransfer;
import org.jivesoftware.smackx.iqregister.AccountManager;
import org.jivesoftware.smackx.vcardtemp.VCardManager;
import org.jivesoftware.smackx.vcardtemp.packet.VCard;
import org.jxmpp.jid.EntityBareJid;
import org.jxmpp.jid.EntityFullJid;
import org.jxmpp.jid.Jid;
import org.jxmpp.jid.impl.JidCreate;
import org.jxmpp.jid.parts.Localpart;
import org.jxmpp.jid.parts.Resourcepart;
import org.jxmpp.stringprep.XmppStringprepException;

import java.io.File;
import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.security.PublicKey;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.Timer;
import java.util.TimerTask;

import static com.example.yang.myapplication.sqlite_linkmanmss.KEY_MESSAGE_TYPE_GIF;
import static com.example.yang.myapplication.sqlite_linkmanmss.KEY_MESSAGE_TYPE_IMAGE;
import static com.example.yang.myapplication.sqlite_linkmanmss.KEY_MESSAGE_TYPE_STRING;
import static com.example.yang.myapplication.sqlite_linkmanmss.KEY_MESSAGE_TYPE_VIDEO;
import static com.example.yang.myapplication.sqlite_linkmanmss.KEY_MESSAGE_TYPE_VOICE;
import static org.jivesoftware.smackx.filetransfer.FileTransferManager.getInstanceFor;

public class XmppConnection  {

    private static XmppConnection xmppconnectiion;
    private final String TAG = "XmppConnection";
    private String XMPP_DOMAIN = "izbp18jgl46o50s70yq4lqz";
    private String XMPP_HOST = "121.199.45.32";
    private static XMPPTCPConnection mConnection;
    private Presence.Type isOnLine = Presence.Type.unavailable;
    private ChatManager mChatManager;

    private int logintime = 30 * 1000;
    private Timer tReconn;

    private Handler mHandler = new Handler();
	
    //????????????
    public static XmppConnection getInstance(){
		if (xmppconnectiion == null) {
         xmppconnectiion = new XmppConnection();
		 xmppconnectiion.connect();
     }
     return xmppconnectiion;
	}

    private Runnable runnable = new Runnable() {

        @Override
        public void run() {
            setOnLine(Presence.Type.available);
            //??????1s????????????run??????
            mHandler.postDelayed(runnable, 360000);
        }
    };

    class ReconnTimetask extends TimerTask {
        @Override
        public void run() {
            if (!mConnection.isConnected() || !mConnection.isAuthenticated()) {
                System.out.println("????????????...");
                mConnection.disconnect();
                // ???????????????
                try {
                    mConnection.connect();
                    // ???????????????
                    mConnection.login();
                    setOnLine(Presence.Type.available);
                } catch (Exception e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }
        }
    }
	
    /**********************************************************************************************
     * ???????????????
     * @return ?????????????????????
     *********************************************************************************************/
    private void connect() {
        try {
            if(mConnection == null) {
                XMPPTCPConnectionConfiguration configuration =
                        XMPPTCPConnectionConfiguration.builder()
                                .setXmppDomain(XMPP_DOMAIN) // ????????????
                                .setHostAddress(InetAddress.getByName(XMPP_HOST)) // ????????????
                                .setPort(5222) // ????????????
                                .setSecurityMode(ConnectionConfiguration.SecurityMode.disabled) // ??????SSL??????
                                .setCompressionEnabled(false) // ??????SSL??????
                                .setSendPresence(true) // ?????????????????????
                                //.setDebuggerEnabled(true) // ??????????????????
                                .build();
                // ?????????????????????????????????????????????
                Roster.setDefaultSubscriptionMode(Roster.SubscriptionMode.manual);
                XMPPTCPConnection connection = new XMPPTCPConnection(configuration);
                connection.setUseStreamManagementResumption(true);
                connection.addConnectionListener(new XMPPConnectionListener());
                connection.connect();// ??????, ???????????????
                this.mConnection = connection;
                ProviderManager.addIQProvider("query", "hoo.iq.userinfo", new Login.PhoneProvider());
            }
        } catch (UnknownHostException e) {
            e.printStackTrace();
        } catch (XmppStringprepException e) {
            e.printStackTrace();
        } catch (InterruptedException | IOException | XMPPException | SmackException e) {
            e.printStackTrace();
        }
    }

    public XMPPTCPConnection getXmppTcpConnection(){
        return mConnection;
    }

    /**********************************************************************************************
     * ????????????
     *********************************************************************************************/
    class XMPPConnectionListener implements ConnectionListener {

        private final String TAG = "XMPPConnectionListener";

        @TargetApi(Build.VERSION_CODES.LOLLIPOP)
        @Override
        public void connected(XMPPConnection connection) {
            Log.d(TAG,"connected");
        }

        @Override
        public void authenticated(XMPPConnection connection, boolean resumed) {

        }

        @RequiresApi(api = Build.VERSION_CODES.LOLLIPOP)
        @Override
        public void connectionClosed() {
            Log.d(TAG,"connectionClosed");
            try {
                tReconn = new Timer();
                tReconn.schedule(new ReconnTimetask(), logintime);
            } catch (Exception ee) {
                ee.printStackTrace();
            }
        }

        @Override
        public void connectionClosedOnError(Exception e) {
            System.out.println("connectionClosedOnError");

            try {
                tReconn = new Timer();
                tReconn.schedule(new ReconnTimetask(), logintime);
            } catch (Exception ee) {
                ee.printStackTrace();
            }
        }
    }

    /**********************************************************************************************
     * ????????????
     *********************************************************************************************/
    public void disConnect() {
        checkConnection();
        if (mConnection != null && mConnection.isConnected()){
            //timer.cancel();
            mConnection.disconnect();
        }
        mConnection = null;
    }

    /**********************************************************************************************
     * ?????????????????????
     *********************************************************************************************/
    public boolean checkConnection() {
        return null != mConnection && mConnection.isConnected();
    }

    /********************************************************************************************
     * ??????
     * @return ????????????????????? true ??????; false ?????????
     ********************************************************************************************/
    public boolean RegisterAc(Map<String, String> map) throws XmppStringprepException {
        if (mConnection != null && mConnection.isConnected()) {
            // ??????connect ????????????????????????????????????
            try {
                AccountManager accountManager = AccountManager.getInstance(mConnection);
                if (accountManager.supportsAccountCreation()) {
                    accountManager.sensitiveOperationOverInsecureConnection(true);
                    accountManager.createAccount(Localpart.from(map.get("account")), map.get("password"));
                    return true;
                }
            } catch (SmackException.NoResponseException e) {
                e.printStackTrace();
                Log.e(TAG,"RegisterAc NoResponseException"+e);
            } catch (XMPPException.XMPPErrorException e) {
                e.printStackTrace();
                Log.e(TAG,"RegisterAc XMPPErrorException"+e);
           /*    if (e.getXMPPError().getCondition() == XMPPError.Condition.conflict) {
                    // ??????????????????
                }*/
            } catch (SmackException.NotConnectedException e) {
                Log.e(TAG,"RegisterAc NotConnectedException"+e);
                e.printStackTrace();
            } catch (InterruptedException e) {
                e.printStackTrace();
                Log.e(TAG,"RegisterAc InterruptedException"+e);
            }
        }

        return false;
    }

    /*********************************************************************************************
     * ???????????????
     * @param userName ?????????
     * @param passWord ??????
     * @return ????????????????????? true ??????; false ?????????
     ********************************************************************************************/
    public boolean login(Context context,String userName, String passWord) {
        checkConnection(); // ??????????????????
        try {
            if (islogin()){ // ??????????????????
                mConnection.login(userName, passWord, Resourcepart.from(SystemUtil.getIMEI(context)));
				//timer.schedule(task,0,60000);
				mHandler.postDelayed(runnable, 60000);
                //addListener(); // ??????????????????
                return true;
            }
            return false;
        } catch (XMPPException | SmackException | InterruptedException | IOException e) {
            Log.e(TAG,"????????????");
            e.printStackTrace();
            return false;
        }
    }

    public boolean islogin(){
        return mConnection != null && !mConnection.isAuthenticated();
    }

    /**********************************************************************************************
     * ??????????????????
     *********************************************************************************************/
    public EntityFullJid getCurrentUser() {
        return mConnection.getUser();
    }

    /**
     * ???????????? ?????????
     * @param user_name jid
     * @param nick_name ????????????
     * @return ??????????????????
     */
    public boolean addFriend(String user_name,String nick_name){
        Log.d(TAG, "addFriend");
        if (mConnection != null) {
            try {
                try {
                    Roster.getInstanceFor(mConnection).createEntry(JidCreate.bareFrom(user_name),
                            nick_name, null);
                } catch (SmackException.NotLoggedInException e) {
                    e.printStackTrace();
                } catch (SmackException.NoResponseException e) {
                    e.printStackTrace();
                } catch (XMPPException.XMPPErrorException e) {
                    e.printStackTrace();
                } catch (SmackException.NotConnectedException e) {
                    e.printStackTrace();
                } catch (InterruptedException e) {
                    e.printStackTrace();
                } catch (XmppStringprepException e) {
                    e.printStackTrace();
                }
                return true;
            } catch (Exception e) {
                Log.e(TAG, e.toString());
                e.printStackTrace();
            }
        }
        return false;
    }
	
	public void deleteRoster(String user) {
        EntityBareJid jid = null;
        try {
             jid =JidCreate.entityBareFrom(user);
        } catch (XmppStringprepException e) {
            e.printStackTrace();
        }
        Roster mRoster = Roster.getInstanceFor(mConnection);
        RosterEntry entry = mRoster.getEntry(jid);
        if (entry != null) {
            try {
                try {
                    mRoster.removeEntry(entry);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            } catch (SmackException.NotLoggedInException |
                    SmackException.NoResponseException |
                    XMPPException.XMPPErrorException |
                    SmackException.NotConnectedException e) {
                e.printStackTrace();
            }
        }
    }

    /***********************************************************************************************
     * ??????????????????
     **********************************************************************************************/
    public void getFriendList() {
        checkConnection();
        Roster roster = Roster.getInstanceFor(mConnection);
        Set<RosterEntry> entries = roster.getEntries();
        Log.e(TAG,entries.size() + "");
        for (RosterEntry entry : entries) {
            Log.e(TAG,entry.toString());
        }
    }
	

    /**********************************************************************************************
     * ???????????????????????????
     **********************************************************************************************/
    public void addRosterListener() {
        // ??????????????????
        Roster roster = Roster.getInstanceFor(mConnection);
        // ???????????????????????????
        ReceiverFriendStatusListener mReceiverFriendStatusListener = new ReceiverFriendStatusListener();
        roster.addRosterListener(mReceiverFriendStatusListener);
        // ???????????????????????????
        AddFriendMessageListener mAddFriendMessageListener = new AddFriendMessageListener();
        roster.addSubscribeListener(mAddFriendMessageListener);
    }

    /**********************************************************************************************
     * ?????????????????????????????????????????????
     * Created by mazaiting on 2017/9/19.
     *********************************************************************************************/
    public class AddFriendMessageListener implements SubscribeListener {
        @Override public SubscribeListener.SubscribeAnswer processSubscribe(Jid from, Presence subscribeRequest) {
            // TODO??????????????????
            Log.e(TAG,"processSubscribe");
            return null;
        }
    }

    /**
     * ?????????????????????????????????????????????,????????????????????????
     * Created by mazaiting on 2017/9/19.
     */
    public class ReceiverFriendStatusListener implements RosterListener {
        @Override public void entriesAdded(Collection<Jid> addresses) {
            Log.e(TAG,"entriesAdded");
        }

        @Override public void entriesUpdated(Collection<Jid> addresses) {
            Log.e(TAG,"entriesUpdated");
        }

        @Override public void entriesDeleted(Collection<Jid> addresses) {
            Log.e(TAG,"entriesDeleted");
        }

        @Override public void presenceChanged(Presence presence) {
            Log.e(TAG,"presenceChanged");
        }
    }

    /**
     * ??????????????????????????????
     */
    public void setOnLine(Presence.Type type) {
        try {
            checkConnection();
         
                Presence presence = new Presence(type);
                presence.setStatus("Gone fishing");// ??????????????????
                mConnection.sendStanza(presence);
                isOnLine = type;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * ??????????????????????????????
     */
    public void getOnLine() {
        try {
            checkConnection();

            Presence presence = new Presence(Presence.Type.available);
            presence.setStatus("Gone fishing");// ??????????????????
            mConnection.sendStanza(presence);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * ??????????????????
     * @param code ????????????
     */
    public void setStatus(int code) {
        Log.d(TAG, "setStatus");
        if (mConnection != null && mConnection.isConnected()) {

            try {
                Presence presence = null;

                /*switch (code) {
                    case XMPP_STATUS_ONLINE: {
                        Log.d(TAG, "????????????");
                        presence = new Presence(Presence.Type.available);
                    }

                    case XMPP_STATUS_CHAT_ME: {
                        Log.d(TAG, "??????Q??????");
                        presence = new Presence(Presence.Type.available)
                        presence.mode = Presence.Mode.chat;
                    }

                    case XMPP_STATUS_BUSY: {
                        Log.d(TAG, "????????????");
                        presence = new Presence(Presence.Type.available);
                        presence.mode = Presence.Mode.dnd;
                    }

                    case XMPP_STATUS_LEAVE: {
                        Log.d(TAG, "????????????");
                        presence = new Presence(Presence.Type.available);
                        presence.mode = Presence.Mode.away;
                    }

                    case XMPP_STATUS_OFFLINE:{

                        Log.d(TAG, "????????????");
                        presence = new Presence(Presence.Type.unavailable);
                    }
                }*/

                mConnection.sendStanza(presence);
                Log.d(TAG, "set status successful");
            } catch (SmackException.NotConnectedException e) {
                e.printStackTrace();
                Log.d(TAG, e.toString());
                connect();
            } catch (InterruptedException e) {
                e.printStackTrace();
                Log.d(TAG, e.toString());
            }


        }
    }

    /**
     * ????????????
     * @param user ??????jid  ????????????demo@serviceName/Spark 2.6.3
     * @param filePath ????????????
     */
    public boolean sendFiles(String user, String filePath,String type) {
        Log.d(TAG,"sendFiles START");
        try {
            EntityFullJid fullJID = JidCreate.entityFullFrom(user);
            File files = new File(filePath);
            FileTransferManager fileManager = getInstanceFor(mConnection);
            OutgoingFileTransfer sendfile = fileManager.createOutgoingFileTransfer(fullJID);
            sendfile.sendFile(files, type);
            long startTime = -1;
            while (!sendfile.isDone()) {
                if (sendfile.getStatus().equals(FileTransfer.Status.error)) {
                    Log.e(TAG,"error"+ sendfile.getStatus());
                    return false;
                } else {
                    double progress = sendfile.getProgress();
                    if (progress > 0.0 && startTime == -1) {
                        startTime = System.currentTimeMillis();
                    }
                    progress *= 100;
                    Log.d(TAG,"STATUS"+sendfile.getStatus());
                    //System.out.println("progress=" + nf.format(progress) + "%");
                }
                try {
                    Thread.sleep(1000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }

            return true;
        } catch (SmackException e) {
            e.printStackTrace();
            return false;
        } catch (XmppStringprepException e) {
            e.printStackTrace();
        }
        return false;
    }
	
	  /**
     * ????????????
     *
     */
    public void receiveFiles(FileTransferListener filelistener){		
        FileTransferManager fileManager=getInstanceFor(mConnection);
        fileManager.addFileTransferListener(filelistener);
    }

    /**
     *????????????
     *@param user ??????JID
     *@param msg ????????????
     */
    //@Override
    public synchronized void sendMessages(String  user, String  msg,String type) throws XmppStringprepException {
        if (null != user && !"@".equals(user))
        {
           // user = user + "@" +con.getServiceName();
        }
        if(user == null || type == null){
            return ;
        }
        EntityBareJid jid =JidCreate.entityBareFrom(user);
        Chat chat=createChat(jid);
        Message message = new Message();
     /*   String body = null;
        if(type.equals(KEY_MESSAGE_TYPE_STRING)){
            body = msg;
        }else if(type.equals(KEY_MESSAGE_TYPE_IMAGE) || type.equals(KEY_MESSAGE_TYPE_VIDEO) || type.equals(KEY_MESSAGE_TYPE_GIF) || type.equals(KEY_MESSAGE_TYPE_VOICE)){
            File file = new File(msg);
            Bitmap bitmap = BitmapFactory.decodeFile(msg);
            byte[] bitdata = PhotoDeal.flattenBitmap(bitmap);
            body = Base64.encodeToString(bitdata, 0);
            //message.addSubject("filename",file.getName());
        }*/

        message.setBody(msg);
        message.setType(Message.Type.chat);
        message.addSubject("type",type);
        try {
            chat.send(message);
        } catch (SmackException.NotConnectedException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    /**
     * ????????????
     */
    public void recieveMessage(IncomingChatMessageListener listener) {
        mChatManager = ChatManager.getInstanceFor(mConnection);
        mChatManager.addIncomingListener(listener);
    }
	
    /**
     * ????????????????????????
     */
    public void removeMessageListener(IncomingChatMessageListener listener) {
        mChatManager = ChatManager.getInstanceFor(mConnection);
        mChatManager.removeIncomingListener(listener);      
    }

    public Chat createChat(EntityBareJid userJid) {
        // Assume we've created an XMPPConnection name "connection"._
        mChatManager = ChatManager.getInstanceFor(mConnection);

        Chat curChat = null;

        curChat = mChatManager.chatWith(userJid);
        return curChat;
    }


    private void addListener(XMPPConnection con) {
        // ???????????????
    /*    PacketFilter filterMessage = new PacketTypeFilter(Message.class);
        // ?????????????????????
        PacketListener myListener = new PacketListener() {
            public void processPacket(Packet packet) {
                // ???XML??????????????????????????????
                System.out.println("Body: " + ((Message) packet).getBody());
            }
        };
        // ????????????????????????????????????
        con.addPacketListener(myListener, filterMessage);*/
    }

    public void updateVcard(VCard vCard){
        VCardManager vCardManager = VCardManager.getInstanceFor(mConnection);

        try {
            vCardManager.saveVCard(vCard);
        } catch (SmackException.NoResponseException e) {
            e.printStackTrace();
        } catch (XMPPException.XMPPErrorException e) {
            e.printStackTrace();
        } catch (SmackException.NotConnectedException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    /*??????????????????*/
    public void updateOwnIndo(String field,String value) {
        if (field == null && value == null) {
            return;
        }
        VCard vCard = new VCard();

        //??????
        if (field.equals("image")){
            vCard.setAvatar(value,"image/png");
            vCard.setField("PHOTO", "<TYPE>image/png</TYPE><BINVAL>" + value
                    + "</BINVAL>", true);
        } else if (field.equals("name")) {
            //??????
            vCard.setFirstName(value);
        }else if(field.equals("prefix")){
            //??????
            vCard.setPrefix(value);
        }else if(field.equals("suffix")) {
            //??????
            vCard.setSuffix(value);
        }else if(field.equals("nickname")) {
            //??????
            vCard.setNickName(value);
        }else if(field.equals("Organization")){
            //??????
            vCard.setOrganization(value);
        }else if(field.equals("VOICE")){
            //??????????????????
            vCard.setPhoneHome(field,value);
        }else if(field.equals("CELL")) {
            //??????????????????
            vCard.setPhoneWork(field,value);
        }else {
            vCard.setField(field, value);
        }
        updateVcard(vCard);
    }

    public void setHomeAddr(String field,String value){
        VCard vCard = new VCard();
        vCard.setAddressFieldHome(field,value);
        updateVcard(vCard);
    }


    public void setWorkAddr(String field,String value){
        VCard vCard = new VCard();
        vCard.setAddressFieldWork(field,value);
        updateVcard(vCard);
    }

    /*??????????????????*/
    public VCard getOwnInfo() throws XMPPException.XMPPErrorException, SmackException.NotConnectedException, InterruptedException, SmackException.NoResponseException {
        VCardManager vcManager =  VCardManager.getInstanceFor(mConnection);
        VCard vCard = vcManager.loadVCard();
        return vCard;
    }

    /*??????????????????*/
    public VCard getFriendunisInfo(String user) throws XmppStringprepException, XMPPException.XMPPErrorException, SmackException.NotConnectedException, InterruptedException, SmackException.NoResponseException {
        EntityBareJid jid = JidCreate.entityBareFrom(user);
        VCardManager vcManager =  VCardManager.getInstanceFor(mConnection);
        VCard vCard = vcManager.loadVCard(jid);
        return vCard;
    }
}
