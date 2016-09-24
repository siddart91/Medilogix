<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Medilogix.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="banner">
			<div class="container">
				<div class="banner-bottom">
					<div  id="top" class="callbacks_container">
			      		<ul class="rslides" id="slider4">
			        	<li>
							<img src="images/banner1.jpg" alt="" />
						</li>
						<li>
							<img src="images/banner3.jpg" alt="" />
						</li>
						<li>
							<img src="images/banner4.png" alt="" />
						</li>
						
			      		</ul>
			    	</div>
			    <div class="clearfix"> </div>
				</div>
			</div>
		</div>
		<!--End-banner-->
		<!--Slider-Starts-Here-->
				<script src="js/responsiveslides.min.js"></script>
			 <script>
			    // You can also use "$(window).load(function() {"
			    $(function () {
			      // Slideshow 4
			      $("#slider4").responsiveSlides({
			        auto: true,
			        pager: true,
			        nav: true,
			        speed: 500,
			        namespace: "callbacks",
			        before: function () {
			          $('.events').append("<li>before event fired.</li>");
			        },
			        after: function () {
			          $('.events').append("<li>after event fired.</li>");
			        }
			      });
			
			    });
			  </script>
			<!--End-slider-script-->	
    <!--start-lorem-->
	<div class="lorem">
		<div class="container">
			<div class="lorem-main">
				<!--<div class="lorem-left">
					<img src="images/i.png" alt="">
				</div>-->
				<div class="lorem-right">
					<h3 align="center">Get a Quote and Compare Our Services</h3>
					
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="lorem-top">
				<div class="col-md-4 lorem-top-one">
					<div class="lorem-top-left">
						<h3>
                           <label class="round1">1</label>&nbsp;&nbsp;From</h3>
					<div class="rgstr-main1">
                        <asp:DropDownList ID="ddlOCountry" runat="server" CssClass="select1">
                            <asp:ListItem>Select Country*</asp:ListItem>
                            <asp:ListItem>India</asp:ListItem>
                            <asp:ListItem>Canada</asp:ListItem>
                            <asp:ListItem>Austrelia</asp:ListItem>
                        </asp:DropDownList>                    
					   <br />
                        <asp:TextBox ID="txtOZip" runat="server" value="Zip Code" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Zip Code';}"></asp:TextBox><br />
                          
                        <asp:TextBox ID="txtOCity" runat="server" value="City" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'City';}"></asp:TextBox>
                       
                             </div>
					<!--	<div class="tool">
							<a class="tooltips" href="single.html">
								<span>Read More</span></a>
						</div>-->
					</div>
				</div>
				<div class="col-md-4 lorem-top-one">
					<div class="lorem-top-left">
						<h3><label class="round1">2</label>&nbsp;&nbsp;To</h3>
						
                        <div class="rgstr-main1">
                            <asp:DropDownList ID="ddlDCountry" runat="server" CssClass="select1">
                            <asp:ListItem>Select Country*</asp:ListItem>
                            <asp:ListItem>India</asp:ListItem>
                            <asp:ListItem>Canada</asp:ListItem>
                            <asp:ListItem>Austrelia</asp:ListItem>
                        </asp:DropDownList>                   
					   <br />
                       <asp:TextBox ID="txtDZip" runat="server" value="Zip Code" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Zip Code';}"></asp:TextBox><br />
                        <asp:TextBox ID="txtDCity" runat="server" value="City" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'City';}"></asp:TextBox>
                             </div>

				<!--	<div class="tool">
							<a class="tooltips" href="single.html">
								<span>Read More</span></a>
						</div>-->
					</div>
				</div>
				<div class="col-md-4 lorem-top-one">
					<div class="lorem-top-left">
						<h3><label class="round1">3</label>&nbsp;&nbsp;Dimension & Weight</h3>
						
                        <div class="rgstr-main1"> 
                            <asp:TextBox ID="txtWidth" runat="server" style="width:49%" value="Width(cm)" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Width(cm)';}"></asp:TextBox>
                            <asp:TextBox ID="txtLen" runat="server" style="width:49%"  value="Length(cm)" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Length(cm)';}"></asp:TextBox><br />
                            <asp:TextBox ID="txtHeight" runat="server" value="Height(cm)" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Height(cm)';}"></asp:TextBox><br />
                            <asp:TextBox ID="txtWeight" runat="server" value="Weight(kg)" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Weight(kg)';}"></asp:TextBox>
                             </div>
				<!--	<div class="tool">
							<a class="tooltips" href="single.html">
								<span>Read More</span></a>
						</div>-->
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
           	<div class="r-submit" align="center" >
                   <asp:Button ID="btnGet" runat="server" Text="      Get Quote       " OnClick="btnGet_Click" style="font-weight: bolder; font-size:25px; background-color: #FF0000;border-radius:20px;"/>
						<%--<input  type="submit" 
                            style="font-weight: bolder; font-size:25px; background-color: #FF0000;border-radius:20px;"  
                            value="      Get Quote       "/>--%>
					</div>

           
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:GridView ID="GridView1" runat="server"></asp:GridView>
                    <table>
                    <asp:Repeater ID="repQuotes" runat="server">
                        <HeaderTemplate>                            
                                <tr>
                                    <td>Service Name</td>
                                    <td>Estimated Delivery</td>
                                    <td>Latest Booking</td>
                                    <td>Latest Pickup</td>
                                    <td>Last Pickup for Day(*)</td>
                                    <td>Estimated Price</td>
                                </tr>                            
                        </HeaderTemplate>
                        <ItemTemplate>                            
                                <tr>
                                    <td><%# Eval("ProductShortName") %></td>
                                    <%--<td><%# Eval("DeliveryDate") %> by <%# Eval("DeliveryTime") %></td>--%>
                                    <td><%# Eval("ShipCharge") %></td>
                                    <td><%# Eval("Tax") %></td>
                                    <td><%# Eval("Premium") %></td>
                                    <%--<td><%# Eval("ShippingCharge") %></td>--%>
                                </tr>                           
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnGet" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
			<%--<div class="lorem-middle">
				<div class="lorem-middle-top">
				
                    <div class="row">
					<div class="col-md-12">
						<div class="panel panel-users">
							<div class="panel-heading" style="background-color: rgba(255, 193, 7, 0.58);">
								<h3 class="panel-title" style="color: #000000">Price from different Services
									
								</h3>
							</div>
							<div class="panel-body">
								<table class="table users-table  table-hover " >
									<thead>
										<tr>
											<th  class="visible-lg">#</th>
											<th >Company</th>
											<th  class="visible-lg">Estimate Days</th>
											<th class="visible-lg">Base Charge</th>
											<th>Other Charge</th>
											<th>Total</th>
                                            <th class="visible-lg">&nbsp;</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td class="visible-lg">1</td>
											<td>DHL</td>
											<td class="visible-lg">5 </td>
											<td class="visible-lg">30 CAD</td>
										
											<td>10 CAD</td>
											<td>
												40 CAD
											</td>
                                            	<td class="visible-lg"><a class="btn btn-hg btn-noty btn-success" data-layout="topLeft" data-type="success" href="Payment.htm">Select <i class="icon-caret-right"></i></a></td>
										</tr>
										<tr>
											<td class="visible-lg">2</td>
											<td>Fedex</td>
											<td class="visible-lg">6 </td>
											<td class="visible-lg">35 CAD</td>
											
											<td>15 CAD</td>
											<td>
												50 CAD
											</td>
                                            <td class="visible-lg"><a class="btn btn-hg btn-noty btn-success" data-layout="topLeft" data-type="success" href="Payment.htm">Select <i class="icon-caret-right"></i></a></td>
										</tr>
                                        
                                        <tr runat="server" id="tr1">
                                        
											<td class="visible-lg">3</td>
											<td>Express</td>
											<td class="visible-lg">5 </td>
											<td class="visible-lg">30 CAD</td>
											
											<td>10 CAD</td>
											<td>
												40 CAD
											</td>
                                            <td class="visible-lg"><a class="btn btn-hg btn-noty btn-success" data-layout="topLeft" data-type="success" href="Payment.htm">Select <i class="icon-caret-right"></i></a></td>
										</tr>

										<!--<tr>
											<td class="visible-lg">3</td>
											<td><img src="images/theme/avatarThree.png" alt="" class="avatar"></td>
											<td  class="visible-lg">Jump </td>
											<td class="visible-lg">Deo</td>
											<td class="visible-lg">johndeo@example.com</td>
											<td>@johndeo</td>
											<td>
												<button type="button" class="btn btn-info"><i class="icon-envelope"></i></button>
												<button type="button" class="btn btn-info"><i class="icon-eye-open"></i></button>
												<button type="button" class="btn btn-info"><i class="icon-edit"></i></button>
											</td>
										</tr>-->
									
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
					<p>Any Notice Placed here...</p>
				</div>
				
			</div>--%>
			
		</div>
	</div>	
</asp:Content>
