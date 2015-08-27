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
    public class EgresadoDetalleBR
    {
        public static List<EgresadoDetalleBE> ListEgresadoDetalle(int IdEgresado)
        {
            List<EgresadoDetalleBE> oListEgresadoDetalle = new List<EgresadoDetalleBE>();

            try
            {
                db_ControlEgresadosDataSet dst = new db_ControlEgresadosDataSet();
                DA.db_ControlEgresadosDataSetTableAdapters.EgresadosDetalleTableAdapter dfd = new DA.db_ControlEgresadosDataSetTableAdapters.EgresadosDetalleTableAdapter();

                dfd.GetDetallebyId(IdEgresado.ToString());
                dfd.FillDetallebyId(dst.EgresadosDetalle, IdEgresado.ToString());

                foreach (DataRow o in dst.EgresadosDetalle)
                {
                    EgresadoDetalleBE oDetalle = new EgresadoDetalleBE(o);
                    oListEgresadoDetalle.Add(oDetalle);
                }
                
            }
            catch (Exception)
            {
                throw;
            }

            return oListEgresadoDetalle;
            }

        public static void InsDetalle(EgresadoDetalleBE oDetalle)
        {
            try
            {
                DateTime o1 = new DateTime(oDetalle.InicioLaboral.Year, oDetalle.InicioLaboral.Month, oDetalle.InicioLaboral.Day);
                DateTime o2 = new DateTime(oDetalle.FinLaboral.Year, oDetalle.FinLaboral.Month, oDetalle.FinLaboral.Day);
                db_ControlEgresadosDataSet dst = new db_ControlEgresadosDataSet();
                DA.db_ControlEgresadosDataSetTableAdapters.EgresadosDetalleTableAdapter dfd = new DA.db_ControlEgresadosDataSetTableAdapters.EgresadosDetalleTableAdapter();

                int ultimo = Convert.ToInt32(dfd.GetUltimoDetalle(oDetalle.IdEgresado)) + 1;

                dfd.InsDetalle(oDetalle.IdEgresado, ultimo, oDetalle.Empresa, oDetalle.Puesto, oDetalle.Area, o1, o2, oDetalle.DescripcionTarea, oDetalle.Estado, UsuarioBE.IdUsuario);

                oDetalle.Correlativo = ultimo;
            }
            catch (Exception)
            {
                throw;
            }

        }

        public static void UpdDetalle(EgresadoDetalleBE oDetalle, int Estado)
        {
            try
            {
                DateTime o1 = new DateTime(oDetalle.InicioLaboral.Year, oDetalle.InicioLaboral.Month, oDetalle.InicioLaboral.Day);
                DateTime o2 = new DateTime(oDetalle.FinLaboral.Year, oDetalle.FinLaboral.Month, oDetalle.FinLaboral.Day);
                db_ControlEgresadosDataSet dst = new db_ControlEgresadosDataSet();
                DA.db_ControlEgresadosDataSetTableAdapters.EgresadosDetalleTableAdapter dfd = new DA.db_ControlEgresadosDataSetTableAdapters.EgresadosDetalleTableAdapter();

                dfd.UpdDetalle(oDetalle.Empresa, oDetalle.Puesto, oDetalle.Area, o1, o2, oDetalle.DescripcionTarea, oDetalle.Estado, oDetalle.IdEgresado, oDetalle.Correlativo);
            }
            catch (Exception)
            {
                throw;
            }

        }
    }
}
