using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Xml.Linq;

namespace Medilogix
{
    public partial class Home : System.Web.UI.Page
    {
        // Connection String
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["mystr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!Page.IsPostBack)
            //{
                SqlCommand cmd = new SqlCommand("Select DHL_C_Code, Country_Name from Country", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                ddltoCountry.DataSource = ds.Tables[0];
                ddltoCountry.DataTextField = "Country_Name";
                ddltoCountry.DataValueField = "DHL_C_Code";
                ddltoCountry.DataBind();
                ddltoCountry.Items.Insert(0, new ListItem("--Select Country--", "0"));
            //}
        }

        protected void btnGet_Click(object sender, EventArgs e)
        {
            //CreateReqXMLStr();
            XmlDocument doc = new XmlDocument();
            doc.Load(@"E:\Projects\Medilogix\Medilogix\Valid10_Quote_AP_PriceBreakdownRAS_Request.xml");
            string str = GetXMLAsString(doc);

            string Du = "";
            string Wu = "";
            string IsDutiable = "";
            if (rbtnLUnits.SelectedIndex == 0)
            {
                Du = "CM";
                Wu = "KG";
            }
            else
            {
                Du = "IN";
                Wu = "LB";
            }

            if (ckbDuti.Checked)
            {
                IsDutiable = "Y";
            }
            else
            {
                IsDutiable = "N";
            }
            //string str = CreateReqXMLStr(ddlfrmCountry.SelectedValue,txtfrmZip.Text,txtShipDate.Text, Du, Wu, "CAD", IsDutiable, ddltoCountry.SelectedValue,txttoZip.Text,txtDV.Text);
            string requestText = str;

            WebRequest requestRate = HttpWebRequest.Create("http://xmlpitest-ea.dhl.com/XMLShippingServlet");
            requestRate.ContentType = "application/x-www-form-urlencoded";
            requestRate.Method = "POST";

            using (var stream = requestRate.GetRequestStream())
            {
                var arrBytes = System.Text.ASCIIEncoding.ASCII.GetBytes(requestText);
                stream.Write(arrBytes, 0, arrBytes.Length);
                stream.Close();
            }

            WebResponse responseRate = requestRate.GetResponse();
            Stream respStream = responseRate.GetResponseStream();
            var reader = new StreamReader(respStream, System.Text.Encoding.ASCII);
            string strResponse = reader.ReadToEnd();
            respStream.Close();

            StringReader stream1 = null;
            XmlTextReader reader1 = null;

            DataSet xmlDS = new DataSet();
            stream1 = new StringReader(strResponse);
            // Load the XmlTextReader from the stream
            reader1 = new XmlTextReader(stream1);
            xmlDS.ReadXml(reader1);
            DataTable dt = new DataTable();
            //dt = xmlDS.Tables[6];
            //GridView1.DataSource = GetTableNames(respStream);
            //GridView1.DataBind();
            repQuotes.DataSource = GetTableNamess(strResponse);
            repQuotes.DataBind();
        }

        public string GetXMLAsString(XmlDocument myxml)
        {

            StringWriter sw = new StringWriter();
            XmlTextWriter tx = new XmlTextWriter(sw);
            myxml.WriteTo(tx);

            string str = sw.ToString();// 
            return str;
        }

        public DataTable GetTableNames(Stream red)
        {
            try
            {
                DataTable dtQtdShp = new DataTable("QtdShp");
                dtQtdShp.Columns.Add("ProductShortName", typeof(String));
                dtQtdShp.Columns.Add("ChargeValue", typeof(String));
                //dtQtdShp.Columns.Add("Location", typeof(String));

                //DataTable dtQtdShpExChrg = new DataTable("QtdShpExChrg");
                //dtQtdShpExChrg.Columns.Add("ChargeValue", typeof(String));
                XElement elementXML = XElement.Load(red);
                IEnumerable<XElement> elem = elementXML.Elements();

                foreach (var Product in elem)
                {
                    string ProductShortName = Product.Element("ProductShortName").Value;
                    string ChargeValue = Product.Element("QtdShpExChrg").Element("ChargeValue").Value;
                    dtQtdShp.Rows.Add(ProductShortName, ChargeValue);

                    //var orders = from order in elementXML.Descendants("order")
                    //select order;

                    //foreach (var order in Product.Descendants("QtdShpExChrg"))
                    //{
                    //    string ChargeValue = order.Element("ChargeValue").Value;
                    //    //string details = order.Element("details").Value;

                    //    dtQtdShpExChrg.Rows.Add(null, ChargeValue);
                    //}

                }

                return dtQtdShp;
                //return new DataTable[2] { dtQtdShp, dtQtdShpExChrg };
            }
            catch (Exception es)
            {
                throw es;
            }
        }

        public DataTable GetTableNamess(string red)
        {
            try
            {
                XmlDocument Docs = new XmlDocument();
                Docs.LoadXml(red);
                XmlElement root = Docs.DocumentElement;
                DataTable dt = new DataTable();
                dt.Columns.Add("ProductShortName");
                dt.Columns.Add("ShipCharge");
                dt.Columns.Add("Tax");
                dt.Columns.Add("Premium");
                //dt.Columns.Add("NoOfDay");
                //dt.Columns.Add("dateColumn");
                XmlNode nodes = root.SelectSingleNode("//GetQuoteResponse/BkgDetails");
                XmlNodeList nodes2 = root.SelectNodes("//GetQuoteResponse/BkgDetails/QtdShp/QtdShpExChrg");
                string pNamr = "";
                string Scharge = "";
                string charge = "";
                for (int i = 0; i < nodes.ChildNodes.Count; i++)
                {
                    if (nodes.ChildNodes[i].Name == "QtdShp")
                    {
                        for (int j = 0; j < nodes.ChildNodes[i].ChildNodes.Count; j++)
                        {
                            string nName = nodes.ChildNodes[i].ChildNodes[j].Name;
                            switch(nName)
                            {
                                case "ProductShortName":
                                    pNamr = nodes.ChildNodes[i].ChildNodes[j].InnerText;
                                    break;
                                case "ShippingCharge":
                                    Scharge = nodes.ChildNodes[i].ChildNodes[j].InnerText;
                                    break;
                                case "QtdShpExChrg":
                                    //nodes.ChildNodes[i].ChildNodes[j].ChildNodes.
                                    //string Scharge = nodes.ChildNodes[i].ChildNodes[j].InnerText;
                                    for (int k = 0; k < nodes.ChildNodes[i].ChildNodes[j].ChildNodes.Count; k++)
                                    {
                                        if (nodes.ChildNodes[i].ChildNodes[j].ChildNodes[k].Name == "ChargeValue")
                                        {
                                            //string[] arrcharge = new string[1];
                                            charge = charge + "," +nodes.ChildNodes[i].ChildNodes[j].ChildNodes[k].InnerText;
                                        }
                                    }
                                    break;
                            }                            
                        }
                        string[] charges = charge.Split(',');
                        if (charges.Length == 2)
                        {
                            dt.Rows.Add(pNamr, Scharge, charges[1], "00.0");
                        }
                        else if (charges.Length == 3)
                        {
                            dt.Rows.Add(pNamr, Scharge, charges[1], charges[2]);
                        }
                        else{
                            dt.Rows.Add(pNamr, Scharge, "00.0", "00.0");
                        }
                        charge = "";
                    }

                }                
                return dt;
            }
            catch (Exception es)
            {
                throw es;
            }
        }

        protected void ddlNoPieces_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Gets value for number of pieces
            int NoOfPieces = ddlNoPieces.SelectedIndex;
            GenerateTableRow(NoOfPieces);
        }

        //Sets the number of pieces
        public void GenerateTableRow(int rows)
        {
            //Looping to rows
            for(int i = 2; i <= rows + 1; i++)
            {
                TableRow row = new TableRow();
                //Looping the columns
                for(int j = 1; j <= 5; j++)
                {
                    TableCell cell = new TableCell();
                    TextBox tb = new TextBox();
                    switch (j)
                    {
                        case 1:
                            cell.Text = i + ".";
                            break;
                        case 2:
                            tb.ID = "txtWeight" + i;
                            cell.Controls.Add(tb);
                            break;
                        case 3:
                            tb.ID = "txtLen" + i;
                            cell.Controls.Add(tb);
                            break;
                        case 4:
                            tb.ID = "txtWidth" + i;
                            cell.Controls.Add(tb);
                            break;
                        case 5:
                            tb.ID = "txtHeight" + i;
                            cell.Controls.Add(tb);
                            break;
                    }
                    
                    //cell.Controls.Add(tb);
                    row.Cells.Add(cell);
                }
                tbdetails.Rows.Add(row);
            }
        }

        // Class to override string writer encoding
        public class StringWriterWithEncoding : StringWriter
        {
            public StringWriterWithEncoding(StringBuilder sb, Encoding encoding)
                : base(sb)
            {
                this.m_Encoding = encoding;
            }
            private readonly Encoding m_Encoding;
            public override Encoding Encoding
            {
                get
                {
                    return this.m_Encoding;
                }
            }
        }

        //Class to generate xml request for quotes
        public string CreateReqXMLStr(string FoCC, string FoPin, string date, string Du, string Wu, string CC, string IsDutiable, string ToCC, string ToPin, string Dv)
        {
            string xmlstr = null; //return string
            XmlWriterSettings settings = new XmlWriterSettings();
            settings.Indent = true;
            settings.CloseOutput = true;

            StringBuilder sb = new StringBuilder();
            // String writer with encoding UTF8
            StringWriterWithEncoding stringWriter = new StringWriterWithEncoding(sb, Encoding.UTF8);

            XmlWriter writer = XmlWriter.Create(stringWriter, settings); 

            writer.WriteStartDocument();
            writer.WriteStartElement("p","DCTRequest", "http://www.dhl.com");
            writer.WriteAttributeString("xmlns", "xsi", null, "http://www.w3.org/2001/XMLSchema-instance");
            writer.WriteAttributeString("xsi", "schemaLocation", null, "http://www.dhl.com DCT-req.xsd ");
            writer.WriteAttributeString("xmlns", "p2", null, "http://www.dhl.com/DCTRequestdatatypes");
            writer.WriteAttributeString("xmlns", "p1", null, "http://www.dhl.com/datatypes");
            writer.WriteAttributeString("xmlns", "p", null, "http://www.dhl.com");
            writer.WriteStartElement("GetQuote");
            writer.WriteStartElement("Request");
            writer.WriteStartElement("ServiceHeader");
            writer.WriteElementString("MessageTime", "2002-08-20T16:28:56.000-08:00");
            writer.WriteElementString("MessageReference", "1234567890123456789012345678901");
            writer.WriteElementString("SiteID", "medilogs");
            writer.WriteElementString("Password", "21J3diDp9Q");
            writer.WriteEndElement();//ServiceHeader
            writer.WriteEndElement();//Request
            writer.WriteStartElement("From");
            writer.WriteElementString("CountryCode", FoCC);
            writer.WriteElementString("Postalcode", FoPin);
            writer.WriteEndElement();//From
            writer.WriteStartElement("BkgDetails");
            writer.WriteElementString("PaymentCountryCode", FoCC);
            writer.WriteElementString("Date", date);
            writer.WriteElementString("ReadyTime", "PT10H21M");
            writer.WriteElementString("ReadyTimeGMTOffset", "+01:00");
            writer.WriteElementString("DimensionUnit", Du);
            writer.WriteElementString("WeightUnit", Wu);
            writer.WriteStartElement("Pieces");
            writer.WriteStartElement("Piece");
            writer.WriteElementString("PieceID", "1");
            writer.WriteElementString("Height", "30");
            writer.WriteElementString("Depth", "20");
            writer.WriteElementString("Width", "10");
            writer.WriteElementString("Weight", "1.0");
            writer.WriteEndElement();//Piece
            writer.WriteEndElement();//Pieces
            writer.WriteElementString("IsDutiable", IsDutiable);
            writer.WriteElementString("NetworkTypeCode", "AL");
            writer.WriteElementString("InsuredValue", "0.00");
            writer.WriteElementString("InsuredCurrency", CC);
            writer.WriteEndElement();//BkgDetails
            writer.WriteStartElement("To");
            writer.WriteElementString("CountryCode", ToCC);
            writer.WriteElementString("Postalcode", ToPin);
            writer.WriteEndElement();//To
            writer.WriteStartElement("Dutiable");
            writer.WriteElementString("DeclaredCurrency", CC);
            writer.WriteElementString("DeclaredValue", Dv);
            writer.WriteEndElement();//Dutiable
            writer.WriteEndElement();//GetQuote
            writer.Close();
            xmlstr = sb.ToString();
            return xmlstr;
        }
    }
}