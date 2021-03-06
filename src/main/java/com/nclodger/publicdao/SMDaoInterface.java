package com.nclodger.publicdao;

import com.nclodger.additional.AccommodationTotalValue;
import com.nclodger.additional.HotelManagingInfo;
import com.nclodger.additional.HotelTotalOrder;
import com.nclodger.domain.SManager;
import com.nclodger.logic.HotelCommissionDTO;
import com.nclodger.logic.HotelDiscountDTO;
import com.nclodger.myexception.MyException;

import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: Iaroslav
 * Date: 30.10.13
 * Time: 11:26
 * To change this template use File | Settings | File Templates.
 */
public interface SMDaoInterface {
    public boolean insert(SManager smanager) throws MyException;
    public boolean insert(int id_user) throws MyException;
    public boolean delete(SManager smanager) throws MyException;
    public boolean delete(int id_user) throws MyException;
    public boolean getSManager(String email, String password) throws MyException;
    public SManager getSManager(int id) throws MyException;
    public int getSmanagerId(String email) throws MyException;
    public boolean setCommAndDiscounts(int id_sm, double commission, double vip_discount, double user_discount) throws MyException;
    public Integer getCommission(Integer idSm) throws MyException;    
    public List<HotelTotalOrder> sortHotelbyPopular() throws MyException;
    public SManager getCurrentCommAndDiscounts(final String email) throws MyException;
    public List<HotelTotalOrder> sortHotelbyPopularWithTimeFrame(final String start, final String end) throws MyException;
    public List<AccommodationTotalValue> sortAccommodationbyValuable() throws MyException;
    public List<AccommodationTotalValue> sortAccommodationbyValuableWithTimeFrame(final String start, final String end) throws MyException;
    public List<HotelCommissionDTO> getHotelCommissions(int hotel_exp_id) throws MyException;
    public List<HotelDiscountDTO> getHotelDiscounts(int hotel_exp_id) throws MyException;
    public Boolean isOccupied(Integer id_sm, Integer id_hotel) throws MyException;
    public Integer getIdHotelByIdDTO(Integer idDTO) throws MyException;
    public Boolean insertHotelManager(Integer id_hotel, Integer id_sm, Integer commission) throws MyException;
    public Boolean deleteHotelManager(Integer id_hotel, Integer id_sm) throws MyException;
    public List<HotelManagingInfo> getAllOccupyHotelOfSMByID(Integer idsm) throws MyException;
    public Map<Integer, List<HotelCommissionDTO>> getHotelCommissionsBatch(List<Integer> hotel_ids) throws MyException;
    public List<Integer> getIDSM() throws MyException;

}