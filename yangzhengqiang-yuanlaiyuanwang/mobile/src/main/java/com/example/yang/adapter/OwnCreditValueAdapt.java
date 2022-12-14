package com.example.yang.adapter;

import android.content.Context;
import android.graphics.Color;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseExpandableListAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import com.example.yang.Activity.OwnCreditValueActivity;
import com.example.yang.myapplication.R;

import java.util.List;

public class OwnCreditValueAdapt extends BaseExpandableListAdapter {
    public static final int TYPE_LEVEL_0 = 0;
    public static final int TYPE_LEVEL_1 = 1;
    private List<OwnCreditValueActivity.TitleInfo> list;
    private Context mContext;

    public OwnCreditValueAdapt(List<OwnCreditValueActivity.TitleInfo> list, Context context) {
        this.list = list;
        mContext = context;
    }

    //组数
    @Override
    public int getGroupCount() {
        return list.size();
    }

    //子数
    @Override
    public int getChildrenCount(int groupPosition) {
        return list.get(groupPosition).getInfo().size();
    }

    //组的对象
    @Override
    public Object getGroup(int groupPosition) {
        return list.get(groupPosition);
    }

    //子的对象
    @Override
    public Object getChild(int groupPosition, int childPosition) {
        return list.get(groupPosition).getInfo().get(childPosition);
    }

    @Override
    public long getGroupId(int groupPosition) {
        return groupPosition;
    }

    @Override
    public long getChildId(int groupPosition, int childPosition) {
        return childPosition;
    }

    //当子条目ID相同时是否复用
    @Override
    public boolean hasStableIds() {
        return true;
    }

    //  is Expandad 展开列表
    @Override
    public View getGroupView(int groupPosition, boolean isExpanded, View convertView, ViewGroup parent) {
        if (convertView == null)
            convertView = View.inflate(mContext, R.layout.credit_value_group_view, null);
        TextView textView = convertView.findViewById(R.id.credit_value_group_text);
        textView.setText(list.get(groupPosition).getTitle());
        if (isExpanded) {
            textView.setTextColor(Color.GREEN);
        } else {
            textView.setTextColor(Color.BLACK);
        }

        return convertView;
    }

    //isLastChild 子条目内容
    @Override
    public View getChildView(int groupPosition, int childPosition, boolean isLastChild, View convertView, ViewGroup parent) {
        ViewHolder2 holder2;
        if (convertView == null) {
            convertView = View.inflate(mContext, R.layout.child_view, null);
            holder2 = new ViewHolder2(convertView);
            convertView.setTag(holder2);
        } else {
            holder2 = (ViewHolder2) convertView.getTag();
        }
        OwnCreditValueActivity.ContentInfo contentInfo = list.get(groupPosition).getInfo().get(childPosition);
        holder2.tv_name.setText(contentInfo.getName());
        //        holder2.tv_qianming.setText(list.get(groupPosition).getInfo().get(childPosition).getQianming());
        return convertView;
    }

    // 子条目是否可以被点击/选中/选择
    @Override
    public boolean isChildSelectable(int groupPosition, int childPosition) {
        return true;
    }

    class ViewHolder2 {
        private TextView tv_name, tv_qianming;
        private ImageView iv_icon;

        public ViewHolder2(View view) {
            tv_name = view.findViewById(R.id.tv_name);
            tv_qianming = view.findViewById(R.id.tv_qianming);
        }
    }

    @Override
    public void onGroupExpanded(int groupPosition) {
        super.onGroupExpanded(groupPosition);
        Log.d("", "onGroupExpanded() called with: groupPosition = [" + groupPosition + "]");
        if (listenter!=null){
            //判断是否已经打开列表的位置
            listenter.onGroupExpanded(groupPosition);
        }
    }

    /**
     * 设置判断是否点击多个组对象的监听
     */
    public void setOnGroupExPanded(OwnParticipateInActivitiesAdapt.OnGroupExpanded listenter){
        this.listenter=listenter;
    }
    public interface OnGroupExpanded{
        void onGroupExpanded(int groupPostion);
    }
    OwnParticipateInActivitiesAdapt.OnGroupExpanded listenter;
}
