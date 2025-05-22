using MasterSex.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
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
    public partial class AddEditPartnerPage : Page
    {
        Partners partner;
        public AddEditPartnerPage()
        {
            InitializeComponent();
            partner = new Partners();
            TbInfo.Text = "Добавление";
            DataContext = partner;
            CBType.ItemsSource = App.db.PartnerTypes.ToList();
        }
        public AddEditPartnerPage(Partners _partner)
        {
            InitializeComponent();
            partner = _partner;
            TbInfo.Text = "Редактирование";
            DataContext = partner;
            CBType.ItemsSource = partner.PartnerTypes.Name;
        }

        private void BTSave_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(partner.Name) || string.IsNullOrWhiteSpace(partner.Email) ||
                string.IsNullOrWhiteSpace(partner.Phone) || string.IsNullOrWhiteSpace(partner.DirektorFIO) ||
                string.IsNullOrWhiteSpace(partner.Address) || string.IsNullOrWhiteSpace(partner.INN) ||
                string.IsNullOrWhiteSpace(partner.Reiting.ToString()) || CBType.SelectedItem == null)
            {
                MessageBox.Show("Заполните все поля!");
                return;
            }
            if (!Regex.IsMatch(partner.INN, @"^[0-9]+$"))
            {
                MessageBox.Show("ИНН содердит только цифры!");
                return;
            }
            if (!Regex.IsMatch(partner.Phone, @"^\+7[0-9]+$"))
            {
                MessageBox.Show("Введите номер телефона полностью, в формате: +7XXXXXXXXXX.");
                return;
            }
            if (!Regex.IsMatch(partner.Reiting.ToString(), @"^[0-9]+$"))
            {
                MessageBox.Show("Рейтинг содердит только цифры!");
                return;
            }
            if (partner.id == 0)
            {
                App.db.Partners.Add(partner);
                App.db.SaveChanges();
                MessageBox.Show("Партнер добавлен");
                return;
            }
            App.db.SaveChanges();
            MessageBox.Show("Данные отредактированы!");
        }

        private void BTCansel_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
    }
}
