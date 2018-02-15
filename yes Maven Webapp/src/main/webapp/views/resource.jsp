<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

  	<section class="tab-item-2">
                                                        <div  height: 500px;">
                                                            <table class="gridView" id="table1">
			
							  			 
                                                            <thead>
                                                                <tr class="gridAlternada">
                                                                        <th>onu_id</th>
                                                                        <th>onu_type</th>
                                                                        <th>olt_id</th>
                                                                        <th>vir_id</th>
                                                                        <th>mac_addr</th>
                                                                        <th>vlan_id</th>
                                                                        <th>onu_state</th>
                                                                        <th>onu_bandwith</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody >
							
                                                            <c:forEach items="${pageParam}" var="item">
							
							
                                                            <tr class="grid">
                                                                    <td>${item.onu_id }</td>
                                                                    <td>${item.onu_type }</td>
                                                                    <td>${item.olt_id }</td>
                                                                    <td>${item.vir_id } </td>
                                                                    <td>${item.mac_addr }</td>
                                                                    <td>${item.vlan_id }</td>
                                                                    <td>${item.onu_state }</td>
                                                                    <td>${item.onu_bandwith }</td>
                                                            </tr>	
								
									
                                                            </c:forEach>						
                                                            </tbody>
                                                            </table>
							</div>

				</section>