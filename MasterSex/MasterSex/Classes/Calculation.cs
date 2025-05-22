using System.Linq;

namespace MasterSex.Classes
{
    public class Calculation
    {
        public int Bombardiro(int idProductType, int idMaterialType, int quantityProducts, decimal length, decimal width)
        {
            if (idMaterialType <= 0 || idMaterialType <= 0 || quantityProducts <= 0) return -1;
                
            try
            {
                var product = App.db.MaterialProducts.FirstOrDefault(x => x.Materials.MaterialTypes.id == idMaterialType
                    && x.Products.idType == idProductType);
                if (product == null) return -1;
                
                var total = product.Amount * (product.Amount * product.Materials.MaterialTypes.Brak.Length) * quantityProducts;
                return (int)total;
            }
            catch
            {
                return -1;

            }

        }
    }
}
