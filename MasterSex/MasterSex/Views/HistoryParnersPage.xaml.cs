using MasterSex.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace MasterSex.Views
{
    public partial class HistoryParnersPage : Page
    {
        public HistoryParnersPage(Partners partners)
        {
            InitializeComponent();
            DgHistoryProducts.ItemsSource = App.db.PartnersProducts.Where(x => x.idPartner == partners.id).ToList();
        }

        private void BtBack_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
    }
}
