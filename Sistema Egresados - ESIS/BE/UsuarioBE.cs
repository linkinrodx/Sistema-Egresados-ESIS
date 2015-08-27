using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace Sistema_Egresados___ESIS.BE
{
    public static class UsuarioBE
    {
        static int oIdUsuario;
        static string oNombre;
        static string oContrasena;
        static string oEstado;

        //public static UsuarioBE(DataRow data)
        //{
        //    oIdUsuario = Convert.ToInt32(data["IdUsuario"]);
        //    oNombre = Convert.ToString(data["Nombre"]);
        //    oContrasena = Convert.ToString(data["Contrasena"]);
        //    oEstado = Convert.ToString(data["Estado"]);
        //}

        public static int IdUsuario
        {
            get { return oIdUsuario; }
            set { oIdUsuario = value; }
        }

        public static string Nombre
        {
            get { return oNombre; }
            set { oNombre = value; }
        }

        public static string Contrasena
        {
            get { return oContrasena; }
            set { oContrasena = value; }
        }

        public static string Estado
        {
            get { return oEstado; }
            set { oEstado = value; }
        }
    }
}
