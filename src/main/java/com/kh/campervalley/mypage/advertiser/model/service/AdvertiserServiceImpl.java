package com.kh.campervalley.mypage.advertiser.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.campervalley.mypage.advertiser.model.dao.AdvertiserDao;
import com.kh.campervalley.mypage.advertiser.model.dto.AdvertiserExt;
import com.kh.campervalley.mypage.advertiser.model.dto.BizStatus;
import com.kh.campervalley.mypage.advertiser.model.dto.LicenseFile;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AdvertiserServiceImpl implements AdvertiserService {

	@Autowired
	AdvertiserDao advertiserDao;

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertAdvertiser(AdvertiserExt advertiser) {
		int result = advertiserDao.insertAdvertiser(advertiser);

		LicenseFile licenseFile = advertiser.getLicenseFile();
		licenseFile.setAdvertiserNo(advertiser.getAdvertiserNo());
		result = advertiserDao.insertLicenseFile(licenseFile);

		return result;
	}
	
	@Override
	public List<AdvertiserExt> selectAdvertiserList(int cPage, int numPerPage) {
		int offset = (cPage - 1) * numPerPage;
		int limit = numPerPage;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return advertiserDao.selectAdvertiserList(rowBounds);
	}
	
	@Override
	public int selectTotalAdvertiser() {
		return advertiserDao.selectTotalAdvertiser();
	}
	
	@Override
	public LicenseFile selectOneLicenseFile(int no) {
		return advertiserDao.selectOneLicenseFile(no);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateAdvertiserPermission(int advertiserNo, String memberId) {
		int result = advertiserDao.updateAdvertiserStatus(advertiserNo);
		
		Map<String, Object> map = new HashMap<>();
		map.put("memberId", memberId);
		map.put("auth", "ROLE_AD");
		result = advertiserDao.insertAuthority(map);
		
		return result;
	}
	
	@Override
	public int updateAdvertiserPause(int advertiserNo, String memberId) {
		Map<String, Object> map = new HashMap<>();
		map.put("memberId", memberId);
		map.put("auth", "ROLE_AD");
		int result = advertiserDao.deleteAuthority(map);
		
		return result;
	}

}
