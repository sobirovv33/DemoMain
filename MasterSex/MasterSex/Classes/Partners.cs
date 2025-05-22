using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.NetworkInformation;
using System.Text;
using System.Threading.Tasks;

namespace MasterSex.Models
{
    public partial class Partners
    {
        public int Discount
        {
            get
            {
                var sale = PartnersProducts.Sum(x => x.Amount * x.Products.MinPriceForPartner);
                if (sale > 10000 && sale < 50000) return 5;
                if (sale >= 50000 && sale < 300000) return 10;
                if (sale >= 300000) return 15;
                return 0;
            }
        }
    }
}
