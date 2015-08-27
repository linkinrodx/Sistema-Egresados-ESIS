using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace Sistema_Egresados___ESIS.BE
{
    public class EgresadoBE
    {
        int oIdEgresado;
        string oNombres;
        string oApellidoPaterno;
        string oApellidoMaterno;
        string oDNI;
        DateTime oFechaNacimiento;
        string oDireccion;
        string oDepartamento;
        string oProvincia;
        string oDistrito;
        string oTelefono;
        string oCelular;
        string oEmail;
        int oAñoEgreso;

        int oEstado;
        List<EgresadoDetalleBE> oDetalle;

        public EgresadoBE()
        {
            oIdEgresado = 0;
            oNombres = string.Empty;
            oDNI = "00000000";
            oEstado = Convert.ToInt32(EstadoOperacion.Activo);
            oDetalle = new List<EgresadoDetalleBE>();
        }

        public EgresadoBE(DataRow data)
        {
            oIdEgresado = Convert.ToInt32(data["IdEgresado"]);
            oNombres = Convert.ToString(data["Nombres"]);
            oApellidoPaterno = Convert.ToString(data["ApellidoPaterno"]);
            oApellidoMaterno = Convert.ToString(data["ApellidoMaterno"]);
            oDNI = Convert.ToString(data["DNI"]);
            try
            {
                oFechaNacimiento = Convert.ToDateTime(data["FechaNacimiento"]);
            }
            catch (Exception)
            {
                oFechaNacimiento = DateTime.Now;
            } 
            oDireccion = Convert.ToString(data["Direccion"]);
            oDepartamento = Convert.ToString(data["Departamento"]);
            oProvincia = Convert.ToString(data["Provincia"]);
            oDistrito = Convert.ToString(data["Distrito"]);
            oTelefono = Convert.ToString(data["Telefono"]);
            oCelular = Convert.ToString(data["Celular"]);
            oEmail = Convert.ToString(data["Email"]);
            oAñoEgreso = Convert.ToInt32(data["AñoEgreso"]);
            oDetalle = new List<EgresadoDetalleBE>();
        }

        #region Datos Egresado
        public int IdEgresado
        {
            get { return oIdEgresado; }
            set { oIdEgresado = value; }
        }

        public string Nombres
        {
            get { return oNombres; }
            set { oNombres = value; }
        }

        public string ApellidoPaterno
        {
            get { return oApellidoPaterno; }
            set { oApellidoPaterno = value; }
        }

        public string ApellidoMaterno
        {
            get { return oApellidoMaterno; }
            set { oApellidoMaterno = value; }
        }

        public string DNI
        {
            get { return oDNI; }
            set { oDNI = value; }
        }

        public DateTime FechaNacimiento
        {
            get { return oFechaNacimiento; }
            set { oFechaNacimiento = value; }
        }

        public string Direccion
        {
            get { return oDireccion; }
            set { oDireccion = value; }
        }

        public string Departamento
        {
            get { return oDepartamento; }
            set { oDepartamento = value; }
        }

        public string Provincia
        {
            get { return oProvincia; }
            set { oProvincia = value; }
        }

        public string Distrito
        {
            get { return oDistrito; }
            set { oDistrito = value; }
        }

        public string Telefono
        {
            get { return oTelefono; }
            set { oTelefono = value; }
        }

        public string Celular
        {
            get { return oCelular; }
            set { oCelular = value; }
        }

        public string Email
        {
            get { return oEmail; }
            set { oEmail = value; }
        }

        public int AñoEgreso
        {
            get { return oAñoEgreso; }
            set { oAñoEgreso = value; }
        }
        #endregion

        public int Estado
        {
            get { return oEstado; }
            set { oEstado = value; }
        }

        public List<EgresadoDetalleBE> Detalle
        {
            get { return oDetalle; }
            set { oDetalle = value; }
        }
        
    }
}
