using System;
using System.Globalization;
using System.Linq;
using System.Windows.Data;

namespace QLMNTC.Common
{
    public class PassThroughConverter : IMultiValueConverter
    {
        /// <summary>
        /// Hàm convert parameter về array obj
        /// </summary>
        /// <param name="values"></param>
        /// <param name="targetType"></param>
        /// <param name="parameter"></param>
        /// <param name="culture"></param>
        /// <returns></returns>
        public object Convert(object[] values, Type targetType, object parameter, CultureInfo culture)
        {
            return values.ToArray();
        }

        public object[] ConvertBack(object value, Type[] targetTypes, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}
