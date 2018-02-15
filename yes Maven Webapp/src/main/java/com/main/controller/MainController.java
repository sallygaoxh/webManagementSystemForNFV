package com.main.controller;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.main.model.LPort;
import com.main.model.LRoutab;
import com.main.model.LVlan;
import com.main.model.LoPort;
import com.main.model.LoVlan;
import com.main.service.AdminService;
import com.main.service.Http2JsonService;
import com.main.service.HttpService;
import com.main.service.LPortService;
import com.main.service.LRouTabService;
import com.main.service.LVlanService;
import com.main.service.LoPortService;
import com.main.service.LoVlanService;
import com.main.service.OLTService;
import com.main.service.ONUService;
import com.main.service.DpService;
import com.main.service.PortService;
import com.main.service.SythesisService;

@Controller
@RequestMapping("/admin")
public class MainController {
	
	@Resource(name="adminServiceImpl")
	private AdminService adminservice;
	
	@Resource 
	Http2JsonService jsonService;
	
	@Resource
	ONUService onuService;
	
	@Resource
	DpService DpService;
	
	@Resource
	HttpService  httpService;
	
	@Resource
	PortService portService;
	
	@Resource 
	OLTService oltService;
	
	@Resource
	LoPortService loPortService;
	
	@Resource
	LoVlanService loVlanService;
	
	@Resource
	LPortService lPortService;
	
	@Resource
	LVlanService lVlanService;
	
	@Resource
	LRouTabService lRouTabService;
	
	@Resource
	SythesisService sythesisService;
	
	
	
	
	@RequestMapping(value = "/send.do", method = RequestMethod.POST)
	public void ConnectSend(PrintWriter printWriter,HttpServletRequest request){
		
		
		System.out.println("ok");
		String command= request.getParameter("message");
		System.out.println(command);
		String json=adminservice.connect(command);
		//printWriter.write(""+adminservice.connect(command));
		printWriter.write(""+json);
		printWriter.flush();
		printWriter.close();
//		jsonService.DpJson(json);
//		
		//httpService.getDp(command);
	}
	
	//@Resource
	//DeviceService deviceService;
	
	
	
//	@RequestMapping(value = "/ds.do", method = RequestMethod.GET)
//	public String showDevice(HttpServletRequest request){
//		
//		List<Device> tp=deviceService.selectDevice();
//		//mp.addAttribute("pageParam",deviceService.selectDevice());
//		for(Device a:tp)
//			System.out.println(a);
//		request.setAttribute("pageParam", tp);
//		System.out.println("1");
//		
//		return "/main1";
//		
//		
//	}
	
//	@RequestMapping("/ajaxUser2.do")
//	public @ResponseBody List<Device> ajaxUser(Integer userId){
//		
//		ONU onu=new ONU();
//		onu.setName("olta-7");
//		onu.setOltid(1);
//		onu.setOltName("olta");
//		onu.setVirid(1);
//		onu.setVirName("virtele1");
//		onuService.insertONU(onu);
//		
//		ONU onu1=new ONU();
//		onu1.setName("olta-8");
//		onu1.setOltid(1);
//		onu1.setOltName("olta");
//		onu1.setVirid(1);
//		onu1.setVirName("virtele1");
//		onuService.insertONU(onu1);
//		
//		List<ONU> all=onuService.selectAll();
//		System.out.println(all);
//		
//		onuService.deleteById(21);
//		
//		List<ONU> all1=onuService.selectAll();
//		System.out.println(all1);
//		
//		onuService.deleteByName("olta-8");
//		
//		List<ONU> all2=onuService.selectAll();
//		System.out.println(all2);
//		
//		
//		
//		/*
//		List<ONU> all=onuService.selectAll();
//		List<ONU> olt=onuService.selectOLT(1);
//		List<ONU> vir=onuService.selectVir(1);
//		System.out.println("before");
//		System.out.println(all);
//		System.out.println("\n");
//		System.out.println(olt);
//		System.out.println("\n");
//		System.out.println(vir);
//		System.out.println("\n");
//		System.out.println("after");
//		*/
//		
//		System.out.println("编号："+userId);
//		List<Device> tp=deviceService.selectDevice();
//		//mp.addAttribute("pageParam",deviceService.selectDevice());
//		//String table = null;
//		
//		/*for(Device a:tp)
//			table+="<tr>"+"<td>"+a.getId()+"</td>"+"<td>"+a.getDevices()+"</td>"
//			+"<td>"+a.getCompany()+"</td>"+
//			"<td>"+a.getNationality()+"</td>"+"</tr>";*/
//		
//		
//		
//		return tp;
//	
//	}
	
	
	
	@RequestMapping("/showView.do")
		public String showView(){
			
			return "showView";
		}
	
	

	@RequestMapping("/test.do")
	public void test(HttpServletResponse response){
		
		try {
			// 响应
			response.setContentType("text/html");
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			out.println("删除成功");
			out.flush();
			out.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		httpService.manulSet("getAll");
		
		//httpService.getDp();
		
		//System.out.println(DpService.selectDp(1));
		/*
		List<Integer> a=new ArrayList<Integer>();
		a.add(1);
		a.add(2);
		
		List<String> b=new ArrayList<String>();
		b.add("wang");
		b.add("yu");
		
		Port pt= new Port();
		pt.setDp_id(11);
		pt.setHw_addr("1111");
		pt.setName("23");
		pt.setPortid(7);
		
		List<Port> pts= new ArrayList<Port>();
		pts.add(pt);
		
		
		DataPath dp = new DataPath();
		dp.setSupported_ofp_version(a);
		dp.setAddress(b);
		dp.setDpid(11);
		dp.setState("main");
		dp.setIs_active(true);
		dp.setPorts(pts);
		
		System.out.println("1111"+dp);
		//DpService.insertDp(dp);
		*/
		
		/* 
		 
		  String fileName="d:/data4.json";
		  File file=new File(fileName);
		  StringBuffer sb = new StringBuffer() ;
		  String Json;
		  String line;
		  BufferedReader br=null;
		  try {
		   br=new BufferedReader(new FileReader(file));
		  } catch (FileNotFoundException e) {
		   e.printStackTrace();
		  }
		  try {
		   while((line=br.readLine())!=null){
		    sb.append(line);
		   }
		  } catch (IOException e) {
		   e.printStackTrace();
		  }
		  String json=sb.toString();
		//  System.out.println("json:"+json);

		  //利用com.google.gson 包将json转换成List
		  
		  List<DataPath> qqs=new ArrayList<DataPath>();
		  Gson gson = new Gson();
		  List<JsonElement> list=new ArrayList();
		  JsonParser jsonParser=new JsonParser();
		  JsonElement jsonElement=jsonParser.parse(json);  //将json字符串转换成JsonElement
		  JsonArray jsonArray=jsonElement.getAsJsonArray();  //将JsonElement转换成JsonArray
		  Iterator it=jsonArray.iterator();  //Iterator处理
		  while(it.hasNext()){  //循环
		   jsonElement=(JsonElement) it.next(); //提取JsonElement
		   json=jsonElement.toString();  //JsonElement转换成String
		   DataPath qq1=gson.fromJson(json, DataPath.class); //String转化成JavaBean
		   qqs.add(qq1);  //加入List
		  }
			
		 
		
		  
		  for (DataPath i: qqs)
		  {
			  i.setSupported_ofp_version(i.getSupported_ofp_version());
			  i.setAddress(i.getAddress());
			  DpService.insertDp(i);
		  }
		 
		  System.out.println(qqs);
	*/
		  
		  //System.out.println(DpService.selectDp(1));
		
		
		
//		System.out.println(portService.selectPort(1));
		/*
		String fileName="d:/data3.json";
		  File file=new File(fileName);
		  StringBuffer sb = new StringBuffer() ;
		  String Json;
		  String line;
		  BufferedReader br=null;
		  try {
		   br=new BufferedReader(new FileReader(file));
		  } catch (FileNotFoundException e) {
		   e.printStackTrace();
		  }
		  try {
		   while((line=br.readLine())!=null){
		    sb.append(line);
		   }
		  } catch (IOException e) {
		   e.printStackTrace();
		  }
		  String json=sb.toString();
		//  System.out.println("json:"+json);

		  //利用com.google.gson 包将json转换成List
		  
		  List<OLT> qqs=new ArrayList<OLT>();
		  Gson gson = new Gson();
		  List<JsonElement> list=new ArrayList();
		  JsonParser jsonParser=new JsonParser();
		  JsonElement jsonElement=jsonParser.parse(json);  //将json字符串转换成JsonElement
		  JsonArray jsonArray=jsonElement.getAsJsonArray();  //将JsonElement转换成JsonArray
		  Iterator it=jsonArray.iterator();  //Iterator处理
		  while(it.hasNext()){  //循环
		   jsonElement=(JsonElement) it.next(); //提取JsonElement
		   json=jsonElement.toString();  //JsonElement转换成String
		   OLT qq1=gson.fromJson(json, OLT.class); //String转化成JavaBean
		   qqs.add(qq1);  //加入List
		  }
		  
		  for (OLT i: qqs)
		  {

			  oltService.insertOlt(i);
		  }
		  
		  
		*/
		//httpService.testAddFlow();
	
		
		
			
		 //* 测试Loport
		/*LoPort record = new LoPort();
		List<Integer> a =new ArrayList<Integer>();
		a.add(0);
		//record.setVlans(a);
		record.setValid(0);
		record.setStatus(0);
		record.setIpadd("0.0.0.0");
		record.setInter("G0/0");
		record.setProl("def");
		record.setVir(0);
		record.setMethod(0);
		record.setBw(1000);
		record.setVlcy(JSONArray.fromObject(a).toString());
		
		
		loPortService.insertSelective(record);
		System.out.println(record);*/
		
		
		
		// * Lovlan 调试
		/*List<String> a=new ArrayList<String>();
		a.add("G0/0");
		a.add("G0/1");
		LoVlan record =new LoVlan();
		record.setName("Great Wall");
		//record.setPorts(a);
		record.setPtcy(JSONArray.fromObject(a).toString());
		loVlanService.insertSelective(record);
		System.out.println(record);*/
		
		
		//LPort 调试
	/*	LPort  port = new  LPort();
		port.setBw(111);
		port.setDelay(223);
		port.setValid(1);
		port.setInerrors((long) 112);
		port.setInter("GG0/1");
		port.setInuti("asf");
		port.setIpadd("11.11.11");
		port.setMethod(2);
		port.setOuterrors(113L);
		port.setOututi("sdf");
		port.setPby1("by1");
		port.setPby2("sss");
		port.setPby3(1);
		port.setPby4(1);
		port.setProl("qqqq");
		port.setStatus(1);
		port.setSwitype(1);
		lPortService.insertSelective(port);
		System.out.println("ports"+port.getVlans());*/
		
		//lVlan 调试
		/*LVlan vlan=new LVlan();
		vlan.setId(12);
		vlan.setName("def_name");
		vlan.setSwitype(11);
		vlan.setVby1("def");
		vlan.setVby2("def");
		vlan.setVby3(-1);
		vlan.setVby4(-1);

		List<String> a=new ArrayList<String>();
		a.add("G0/1");
		a.add("G0/2");
		a.add("G0/3");
		a.add("G0/4");*/
		//a.add("G0/5");
		//a.add("G0/6");
		//a.add("G0/7");
		//a.add("G0/8");

		/*vlan.setPorts(a);
		vlan.setVby1("20015998343868");*/
		//System.out.println(JSONArray.fromObject(a).toString());
		//lVlanService.insertSelective(vlan);
		//sythesisService.SysVlanByPort();
		//System.out.println("vlan"+vlan.getPorts());
		
		//Lroutable测试
		/*LRoutab test= new LRoutab();
		test.setCost(-1);
		test.setDest("def");
		test.setInter("def");
		test.setNexthop("def");
		test.setPre(-1);
		test.setRby1("def");
		test.setRby2("def");
		test.setRby3(-1);
		test.setRby4(-1);
		test.setSwitype(-1);
		lRouTabService.insertSelective(test);*/
		

		
		
		
		
		
		
	}
	
	@RequestMapping("/test1.do")
	public void test1(int age1,HttpServletResponse response){
		System.out.println(age1);
		try {
			// 响应
			response.setContentType("text/html");
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			out.println("后台得到数据");
		    out.flush();
			out.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	
	 
}


