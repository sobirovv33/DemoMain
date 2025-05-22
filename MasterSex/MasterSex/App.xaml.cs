using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using System.Windows;
using MasterSex.Models;

namespace MasterSex
{
    public partial class App : Application
    {
        public static KrokodiloEntities db = new KrokodiloEntities();
    }
}
