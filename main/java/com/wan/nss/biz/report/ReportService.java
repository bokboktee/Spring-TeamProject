package com.wan.nss.biz.report;

import java.util.ArrayList;

public interface ReportService {
	public boolean insert(ReportVO rpvo);
	//public ReportVO selectOne(ReportVO rvo);
	public ArrayList<ReportVO> selectAll(ReportVO rpvo);
	public boolean update(ReportVO rpvo);
}