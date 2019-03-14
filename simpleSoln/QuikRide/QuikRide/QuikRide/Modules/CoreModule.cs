using Ninject.Modules;
using QuikRide.Interfaces;
using QuikRide.Services;

namespace QuikRide.Modules
{
    public class CoreModule : NinjectModule
    {
        public override void Load()
        {
            //alternet version is for mocking for unit tests
            Bind<IDatabase>().To<Database>().InSingletonScope();

            //alternate version is for sample data and API
            Bind<IDataLoadService>().To<SampleDataLoadService>().InSingletonScope();

            //we have this one so that we can mock up the service to test our viewmodels
            Bind<IDataRetrievalService>().To<DataRetrievalService>().InSingletonScope();
        }
    }
}