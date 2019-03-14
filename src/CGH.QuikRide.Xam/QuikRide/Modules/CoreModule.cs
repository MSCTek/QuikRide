using Ninject.Modules;
using QuikRide.Interfaces;
using QuikRide.Services;

namespace QuikRide.Modules
{
    public class CoreModule : NinjectModule
    {
        public override void Load()
        {
            Bind<IDatabase>().To<Database>().InSingletonScope();
            Bind<IDataLoadService>().To<SampleDataLoadService>().InSingletonScope();
            Bind<IDataRetrievalService>().To<DataRetrievalService>().InSingletonScope();
        }
    }
}