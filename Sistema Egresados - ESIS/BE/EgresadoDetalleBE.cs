using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

using System.ComponentModel;
using System.Drawing;
using System.Windows.Forms;

namespace Sistema_Egresados___ESIS.BE
{
    public class EgresadoDetalleBE
    {
        int oIdEgresado;
        int oCorrelativo;
        string oEmpresa;
        string oPuesto;
        string oArea;
        DateTime oInicioLaboral;
        DateTime oFinLaboral;
        string oDescripcionTarea;
        int oEstado;

        public EgresadoDetalleBE()
        {
            oEstado = 1;
            oInicioLaboral = DateTime.Now;
            oFinLaboral = DateTime.Now; 
        }
                
        public EgresadoDetalleBE(DataRow data)
        {
            oIdEgresado = Convert.ToInt32(data["IdEgresado"]);
            oCorrelativo = Convert.ToInt32(data["Correlativo"]);
            oEmpresa = Convert.ToString(data["Empresa"]);
            oPuesto = Convert.ToString(data["Puesto"]);
            oArea = Convert.ToString(data["Area"]);
            try
            {
                oInicioLaboral = Convert.ToDateTime(data["InicioLaboral"]);
            }
            catch (Exception)
            {
                oInicioLaboral = DateTime.Now;
            }
            try
            {
                oFinLaboral = Convert.ToDateTime(data["FinLaboral"]);
            }
            catch (Exception)
            {
                oFinLaboral = DateTime.Now;
            }
            oDescripcionTarea = Convert.ToString(data["DescripcionTarea"]);
            oEstado = Convert.ToInt32(data["Estado"]);
        }

        #region Datos Empresa
        public int IdEgresado
        {
            get { return oIdEgresado; }
            set { oIdEgresado = value; }
        }

        public int Correlativo
        {
            get { return oCorrelativo; }
            set { oCorrelativo = value; }
        }

        public string Empresa
        {
            get { return oEmpresa; }
            set { oEmpresa = value; }
        }

        public string Puesto
        {
            get { return oPuesto; }
            set { oPuesto = value; }
        }

        public string Area
        {
            get { return oArea; }
            set { oArea = value; }
        }

        public DateTime InicioLaboral
        {
            get { return oInicioLaboral; }
            set { oInicioLaboral = value; }
        }

        public DateTime FinLaboral
        {
            get { return oFinLaboral; }
            set { oFinLaboral = value; }
        }

        public string DescripcionTarea
        {
            get { return oDescripcionTarea; }
            set { oDescripcionTarea = value; }
        }
        #endregion 

        public int Estado
        {
            get { return oEstado; }
            set { oEstado = value; }
        }
    }
}
