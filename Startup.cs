using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Maderna.Startup))]
namespace Maderna
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
