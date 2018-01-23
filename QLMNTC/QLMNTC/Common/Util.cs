using System;
using System.Collections.Generic;
using System.IO;
using System.Windows;
using System.Xml;

namespace QLMNTC.Common
{
    public static class Util
    {
        public static decimal tienAnSang = 15.0000m;
        public static decimal tienAnTrua = 15.0000m;
        public static decimal tienHoc1Buoi = 50.0000m;

        /// <summary>
        /// hàm tính tiền học phí theo dõi
        /// </summary>
        /// <param name="SoNgayVang"></param>
        /// <param name="SoNgayAnSang"></param>
        /// <param name="SoNgayAnTrua"></param>
        /// <returns></returns>
        public static decimal getHocPhiTheoDoi(int SoNgayVang, int SoNgayAnSang, int SoNgayAnTrua)
        {
            return (22 - SoNgayVang) * tienHoc1Buoi + SoNgayAnSang * tienAnSang + SoNgayAnTrua * tienAnTrua;
        }
        /// <summary>
        /// hàm mở dialog
        /// </summary>
        /// <param name="owner"></param>
        public static void ShowDialog(Window owner)
        {
            owner.ShowDialog();
        }
        /// <summary>
        /// Lấy vị trí màn hình window
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public static List<double> setLocationWindow(string name)
        {
            List<double> pos = new List<double>();
            XmlDocument doc = new XmlDocument();
            XmlElement element;
            string filePath = "LocationWindow.xml";
            if (!File.Exists(filePath))
            {
                doc.LoadXml("<Windows></Windows>");
                XmlTextWriter writer = new XmlTextWriter(filePath, null);
                writer.Formatting = Formatting.Indented;
                doc.Save(writer);

                pos.Add(200);
                pos.Add(200);
            }
            else
            {
                doc.Load(filePath);
                element = doc.DocumentElement;
                XmlNode node = element.SelectSingleNode("/Windows/Window[@name='" + name + "']");
                if (node != null)
                {
                    pos.Add(Convert.ToDouble(node.FirstChild.InnerText));
                    pos.Add(Convert.ToDouble(node.LastChild.InnerText));
                }
                else
                {
                    pos.Add(200);
                    pos.Add(200);
                }
            }
            return pos;
        }
        /// <summary>
        /// lưu vị trí màn hình khi tắt
        /// </summary>
        /// <param name="window"></param>
        public static void SaveLocation(Window window)
        {
            XmlDocument doc = new XmlDocument();
            XmlElement element;
            string path = "LocationWindow.xml";

            if (!File.Exists(path))
            {
                doc.LoadXml("<Windows></Windows>");
                XmlTextWriter writer = new XmlTextWriter(path, null);
                writer.Formatting = Formatting.Indented;
                doc.Save(writer);
            }
            doc.Load(path);
            element = doc.DocumentElement;

            XmlNode node = element.SelectSingleNode("/Windows/Window[@name='" + window.Name + "']");
            if (node != null)
            {
                node.FirstChild.InnerText = window.Top.ToString();
                node.LastChild.InnerText = window.Left.ToString();
                doc.Save(path);
            }
            else
            {
                XmlElement xmlWindow = doc.CreateElement("Window");
                xmlWindow.SetAttribute("name", window.Name);
                XmlElement xmlTop = doc.CreateElement("Top");
                xmlTop.InnerText = window.Top.ToString();
                XmlElement xmlLeft = doc.CreateElement("Left");
                xmlLeft.InnerText = window.Left.ToString();

                xmlWindow.AppendChild(xmlTop);
                xmlWindow.AppendChild(xmlLeft);

                element.AppendChild(xmlWindow);
                doc.Save(path);
            }
        }

    }
}
