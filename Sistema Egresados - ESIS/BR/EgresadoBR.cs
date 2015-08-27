using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data;
using Sistema_Egresados___ESIS.BE;
using Sistema_Egresados___ESIS.DA;

namespace Sistema_Egresados___ESIS.BR
{
    class EgresadoBR
    {
        public static EgresadoBE GetEgresado(int IdEgresado)
        {
            EgresadoBE oEgresado;

            try
            {
                db_ControlEgresadosDataSet dst = new db_ControlEgresadosDataSet();
                DA.db_ControlEgresadosDataSetTableAdapters.EgresadoTableAdapter dfd = new DA.db_ControlEgresadosDataSetTableAdapters.EgresadoTableAdapter();

                dfd.GetEgresadobyId(IdEgresado);
                dfd.FillEgresadobyId(dst.Egresado, IdEgresado);

                oEgresado = new EgresadoBE(dst.Egresado.FirstOrDefault());
                oEgresado.Detalle = EgresadoDetalleBR.ListEgresadoDetalle(oEgresado.IdEgresado);
            }
            catch (Exception)
            {
                throw;
            }

            return oEgresado;
        }

        public static DataTable GetEgresadoTabla(int AnoEgreso, string Nombre, string DNI, DateTime FechaInicio, DateTime FechaFin)
        {
            try
            {
                DateTime o1 = new DateTime(FechaInicio.Year, FechaInicio.Month, FechaInicio.Day);
                DateTime o2 = new DateTime(FechaFin.Year, FechaFin.Month, FechaFin.Day);
                db_ControlEgresadosDataSet dst = new db_ControlEgresadosDataSet();
                DA.db_ControlEgresadosDataSetTableAdapters.EgresadoTableAdapter dfd = new DA.db_ControlEgresadosDataSetTableAdapters.EgresadoTableAdapter();

                dfd.GetEgresadoByFiltros(AnoEgreso, DNI, Nombre, o2, o1);
                dfd.FillEgresadoByFiltros(dst.Egresado, AnoEgreso, DNI, Nombre, o2, o1);

                return dst.Egresado;
            }
            catch (Exception)
            {
                throw;
            }

        }

        public static void InsEgresado(EgresadoBE oEgresado)
        {
            try
            {
                DateTime o1 = new DateTime(oEgresado.FechaNacimiento.Year, oEgresado.FechaNacimiento.Month, oEgresado.FechaNacimiento.Day);
                db_ControlEgresadosDataSet dst = new db_ControlEgresadosDataSet();
                DA.db_ControlEgresadosDataSetTableAdapters.EgresadoTableAdapter dfd = new DA.db_ControlEgresadosDataSetTableAdapters.EgresadoTableAdapter();

                int ultimo = Convert.ToInt32(dfd.GetUltimoEgresado()) + 1;

                dfd.InsEgresado(ultimo, oEgresado.Nombres, oEgresado.ApellidoPaterno, oEgresado.ApellidoMaterno, oEgresado.DNI, o1, oEgresado.Direccion, oEgresado.Departamento, oEgresado.Provincia, oEgresado.Distrito, oEgresado.Telefono, oEgresado.Celular, oEgresado.Email, oEgresado.AñoEgreso, oEgresado.Estado, UsuarioBE.IdUsuario);
                
                oEgresado.IdEgresado = ultimo;

                if (oEgresado.Detalle != null && oEgresado.Detalle.Count > 0)
                    oEgresado.Detalle.ForEach(o => o.IdEgresado = oEgresado.IdEgresado);
                    oEgresado.Detalle.ToList().ForEach(o => EgresadoDetalleBR.InsDetalle(o));
            }
            catch (Exception)
            {
                throw;
            }

        }

        public static void UpdEgresado(EgresadoBE oEgresado, int Estado)
        {
            try
            {
                DateTime o1 = new DateTime(oEgresado.FechaNacimiento.Year, oEgresado.FechaNacimiento.Month, oEgresado.FechaNacimiento.Day);
                db_ControlEgresadosDataSet dst = new db_ControlEgresadosDataSet();
                DA.db_ControlEgresadosDataSetTableAdapters.EgresadoTableAdapter dfd = new DA.db_ControlEgresadosDataSetTableAdapters.EgresadoTableAdapter();

                dfd.UpdEgresado(oEgresado.Nombres, oEgresado.ApellidoPaterno, oEgresado.ApellidoMaterno, oEgresado.DNI, oEgresado.FechaNacimiento, oEgresado.Direccion, oEgresado.Departamento, oEgresado.Provincia, oEgresado.Distrito, oEgresado.Telefono, oEgresado.Celular, oEgresado.Email, oEgresado.AñoEgreso, Estado, oEgresado.IdEgresado);

                if (oEgresado.Detalle != null && oEgresado.Detalle.Count > 0 && Estado == (int)EstadoOperacion.Activo)
                {
                    oEgresado.Detalle.ForEach(o => o.IdEgresado = oEgresado.IdEgresado);

                    foreach (EgresadoDetalleBE p in oEgresado.Detalle)
                    {
                        if (p.Correlativo == 0)
                            EgresadoDetalleBR.InsDetalle(p);
                        else
                            EgresadoDetalleBR.UpdDetalle(p, (int)EstadoOperacion.Activo);
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }

        }
    }
}
