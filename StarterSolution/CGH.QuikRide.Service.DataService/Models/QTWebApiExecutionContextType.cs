using CodeGenHero.DataService;
using System;
using static CGH.QuikRide.Service.DataService.Constants.Enums;

namespace CGH.QuikRide.Service.DataService.Models
{
    public class QRWebApiExecutionContextType : WebApiExecutionContextType
    {
        public override int Current
        {
            get
            {
                return _current;
            }
            set
            {
                switch (value)
                {
                    case (int)ExecutionContextTypes.Base:
                        _current = value;
                        break;

                    default:
                        throw new ArgumentOutOfRangeException($"The value provided, {value}, for the current WebApiExecutionContextType is invalid.");
                }
            }
        }
    }
}