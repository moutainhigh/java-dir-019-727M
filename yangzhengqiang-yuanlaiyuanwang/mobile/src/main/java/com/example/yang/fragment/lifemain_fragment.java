package com.example.yang.fragment;


import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.support.v4.view.PagerAdapter;
import android.support.v4.view.ViewPager;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import com.example.yang.myapplication.R;



/**
 * Created by yang on 2018/3/18.
 */
public class lifemain_fragment extends Fragment implements View.OnClickListener,ViewPager.OnPageChangeListener, ViewPager.OnAdapterChangeListener {

    private TextView itl;
    private TextView pul;
    private ViewPager life_viewpage;
    private life_Fragment_Adapt adapt;
    public lifemain_fragment(){

    }

    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, Bundle savedInstanceState) {
        View view= inflater.inflate(R.layout.fragment_lifemainxml, container, false);
        itl = (TextView) view.findViewById(R.id.installed);
        itl.setOnClickListener(this);
        pul = (TextView) view.findViewById(R.id.popular);
        pul.setOnClickListener(this);
        life_viewpage = (ViewPager) view.findViewById(R.id.life_viewpage);
        FragmentManager manager = getChildFragmentManager();
        FragmentTransaction transaction = manager.beginTransaction();
        ApplicationFragmentPageAdapt mAdapter = new ApplicationFragmentPageAdapt(manager);
        life_viewpage.setAdapter(mAdapter);
        life_viewpage.setCurrentItem(0);
        itl.setSelected(true);
        pul.setSelected(false);
        life_viewpage.addOnPageChangeListener(this);

        return view;
    }

    @Override
    public void onClick(View view) {
            switch (view.getId()){
                case R.id.installed:
                    life_viewpage.setCurrentItem(0);
                    break;
                case R.id.popular:
                    life_viewpage.setCurrentItem(1);
                    break;
            }
    }


    @Override
    public void onPageScrolled(int position, float positionOffset, int positionOffsetPixels) {

    }

    @Override
    public void onPageSelected(int position) {

    }

    @Override
    public void onPageScrollStateChanged(int state) {
        if(state == 2){
            switch (life_viewpage.getCurrentItem()){
                case 0:
                    itl.setSelected(true);
                    pul.setSelected(false);
                    break;
                case 1:
                    pul.setSelected(true);
                    itl.setSelected(false);
                    break;
            }
        }
    }

    @Override
    public void onAdapterChanged(@NonNull ViewPager viewPager, @Nullable PagerAdapter oldAdapter, @Nullable PagerAdapter newAdapter) {

    }
}
