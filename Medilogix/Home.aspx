<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Medilogix.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="banner">
        <div class="container">
            <div class="banner-bottom">
                <div id="top" class="callbacks_container">
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
                <div class="clearfix"></div>
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
            <div class="Quots-widget">
                <div class="To-From">
                    <div id="from" class="Quots-widget-box" style="margin-right: 15px;">
                        <div class="Quots-widget-Header">From<i class="fa fa-location-arrow" aria-hidden="true"></i></div>
                        <br />
                        <label>Country</label>
                        <asp:DropDownList ID="ddlfrmCountry" runat="server">
                            <asp:ListItem Text="Canada" Value="CA"></asp:ListItem>
                        </asp:DropDownList><br />
                        <label>Zip code</label><asp:TextBox ID="txtfrmZip" runat="server" txttype="zip"></asp:TextBox><br />
                        <label>City</label><asp:TextBox ID="txtfrmCity" runat="server" txttype="city"></asp:TextBox>
                    </div>
                    <div id="to" class="Quots-widget-box" style="margin-right: 17px;">
                        <div class="Quots-widget-Header">To<i class="fa fa-map-marker" aria-hidden="true"></i></div>
                        <br />
                        <label>Country</label>
                        <asp:DropDownList ID="ddltoCountry" runat="server"></asp:DropDownList><br />
                        <label>Zip code</label><asp:TextBox ID="txttoZip" runat="server" txttype="zip"></asp:TextBox><br />
                        <label>City</label><asp:TextBox ID="txttoCity" runat="server" txttype="city"></asp:TextBox>
                    </div>
                    <div id="Ship-Details" class="Quots-widget-box">
                        <div class="Quots-widget-Header">Shipment Details<i class="fa fa-calendar" aria-hidden="true"></i></div>
                        <br />
                        <label>Shipping date</label><asp:TextBox ID="txtShipDate" runat="server" txttype="ShipDate" MaxLength="10" ToolTip="YYYY-MM-DD"></asp:TextBox><br />
                        <label>Dutiable Material</label><asp:CheckBox ID="ckbDuti" runat="server" /><br />
                        <label>Declared value (CAD)</label><asp:TextBox ID="txtDV" runat="server" txttype="DV"></asp:TextBox>
                    </div>
                </div>

                <div class="Quots-widget-box" style="width: 100%">
                    <div class="Quots-widget-Header">Piece Details</div>
                    <br />
                    <div style="display: inline-block; width: 25%;">
                        <label style="padding: 5px 15px;">Number of pieces</label>
                        <asp:DropDownList ID="ddlNoPieces" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlNoPieces_SelectedIndexChanged">
                            <asp:ListItem Selected="True">1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem>7</asp:ListItem>
                            <asp:ListItem>8</asp:ListItem>
                            <asp:ListItem>9</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div style="display: inline-block; width: 49%;">
                        <label style="padding: 5px 15px;">Units</label>
                        <div class="radiobuttoncontainer">
                            <asp:RadioButtonList ID="rbtnLUnits" runat="server" CssClass="radiobuttonlist" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                <asp:ListItem Selected="True">kg/cm</asp:ListItem>
                                <asp:ListItem>lb/in</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                    </div>
                    <div class="tb-wrap">
                        <asp:UpdatePanel ID="upPackdetails" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                        <asp:Table ID="tbdetails" runat="server" CssClass="tbPackDetails">
                            <asp:TableHeaderRow>
                                <asp:TableHeaderCell>No.</asp:TableHeaderCell>
                                <asp:TableHeaderCell>Weight</asp:TableHeaderCell>
                                <asp:TableHeaderCell>Length</asp:TableHeaderCell>
                                <asp:TableHeaderCell>Width</asp:TableHeaderCell>
                                <asp:TableHeaderCell>Height</asp:TableHeaderCell>
                            </asp:TableHeaderRow>
                            <asp:TableRow>
                                <asp:TableCell>1.</asp:TableCell>
                                <asp:TableCell><asp:TextBox ID="txtWeight1" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox ID="txtLen1" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox ID="txtWidth1" runat="server"></asp:TextBox></asp:TableCell>
                                <asp:TableCell><asp:TextBox ID="txtHeight1" runat="server"></asp:TextBox></asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                                </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger  ControlID="ddlNoPieces" EventName=""/>
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                </div>

            </div>
            <div class="r-submit" align="center">
                <asp:Button ID="btnGet" runat="server" Text="      Get Quote       " OnClick="btnGet_Click" Style="font-weight: bolder; font-size: 25px; background-color: #FF0000; border-radius: 20px;" />
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
        </div>
    </div>
</asp:Content>
