using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Xml.Linq;

namespace Medilogix
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGet_Click(object sender, EventArgs e)
        {
            XmlDocument doc = new XmlDocument();
            doc.Load(@"C:\Users\Siddharth\Desktop\MedilogixNew\Medilogix\Medilogix\Valid10_Quote_AP_PriceBreakdownRAS_Request.xml");
            string str = GetXMLAsString(doc);
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
            dt = xmlDS.Tables[6];
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
            int NoOfPieces = ddlNoPieces.SelectedIndex;
            GenerateTableRow(NoOfPieces);
        }

        public void GenerateTableRow(int rows)
        {
            for(int i = 2; i <= rows + 1; i++)
            {
                TableRow row = new TableRow();
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
    }
}