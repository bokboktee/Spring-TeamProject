package com.wan.nss.biz.report;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("reportService")
public class ReportServiceImpl implements ReportService {
	
	@Autowired
	private ReportDAO reportDAO;
	
	@Override
	public boolean insert(ReportVO rpvo) {
		return reportDAO.insert(rpvo);
	}
	
//	@Override
//	public ReportVO selectOne(ReportVO rpvo) {
//		return reportDAO.selectOne(rpvo);
//	}
	
	@Override
	public ArrayList<ReportVO> selectAll(ReportVO rpvo){
		return reportDAO.selectAll(rpvo);
	}

	@Override
	public boolean update(ReportVO rpvo) {
		return reportDAO.update(rpvo);
	}
}