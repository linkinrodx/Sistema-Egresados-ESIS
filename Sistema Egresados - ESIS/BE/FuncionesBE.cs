using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data.OleDb;
using System.IO;
using System.Data;
using Microsoft.VisualBasic;
using Microsoft.CSharp;

namespace Sistema_Egresados___ESIS.BE
{
    public enum EstadoForm
    {
        Vacio = 0,
        Navegando = 1,
        Insertando = 2,
        Modificando = 3,
        Cargando = 4
    }

    public enum EstadoOperacion
    {
        Activo = 1,
        Inactivo = 2
    }

    class FuncionesBE
    {
        public void GenerarExcel()
        {
            System.Windows.Forms.SaveFileDialog save = new System.Windows.Forms.SaveFileDialog();
            save.Filter = "Archivo Excel | *.xlsx";
            if (save.ShowDialog() == System.Windows.Forms.DialogResult.OK)
            {

            }

        }

        public void ExportarExcel( string pth)
        {
            object xlapp = new object();
        }


    }
}
