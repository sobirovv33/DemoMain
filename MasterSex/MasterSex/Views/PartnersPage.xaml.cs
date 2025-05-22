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
    public partial class PartnersPage : Page
    {
        public PartnersPage()
        {
            InitializeComponent();
            LVPartners.ItemsSource = App.db.Partners.ToList();
        }

        private void LVPartners_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            var selectedPartner = LVPartners.SelectedItem as Partners;
            NavigationService.Navigate(new AddEditPartnerPage(selectedPartner));
        }

        private void BtAdd_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new AddEditPartnerPage());
        }

        private void BtHistory_Click(object sender, RoutedEventArgs e)
        {
            var selectedPartner = LVPartners.SelectedItem as Partners;

            if (selectedPartner != null)
            {
                NavigationService.Navigate(new HistoryParnersPage(selectedPartner));
                return;
            }
            MessageBox.Show("Выберите партнера для редактирования!");

        }
    }
}
