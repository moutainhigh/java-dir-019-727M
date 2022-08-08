package com.ubiquitous.market.app.api.api.abouts;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.sql.rowset.serial.SerialException;
@Service
public class AddAboutServiceImpl implements AddAboutService {
    @Value("${com.ubiquitous.market.wx.mch-id}")
    private String Telephone;
    @Override
    public String about(Long userId) throws SerialException {
        return Telephone;
    }
}
