package com.main.service;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;



import com.main.dao.DpDao;
import com.main.dao.PortDao;
import com.main.model.DataPath;
import com.main.model.Port;

@Service
public class DpService {
	
	@Resource
	DpDao dpdao;
	
	@Resource
	PortDao portDao;
	
	@Resource 
	PortService portService;
	
	public  List<DataPath> selectDp(int dpid){
		 List<DataPath> list=dpdao.selectDp(dpid);		 	 
		/*		 
		 for(DataPath i:list)
		 {
			
		 }*/
		 return list;
	}
	
	public List<DataPath> selectAll(){
		return  dpdao.selectAll();
	}
	
	public void insertDp(DataPath dp){


		if(dpdao.selectDp(dp.getDpid()).size()==0)
		{	
			dpdao.insertDp(dp);
			for(Port i:dp.getPorts()){
				portService.insertPt(i);
			}
		}	else
		{
		   System.out.println("there is one in the database");
		}
		
	}
	
}
