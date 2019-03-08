namespace QuikRide
{
    public static class Config
    {
#if DEV
        public static string AppCenterDroid = string.Empty;
        public static string AppCenterIOS = string.Empty;
        public static string AppCenterUWP = string.Empty;
        public static string BingMapsKey = string.Empty;
#elif QA
        public static string AppCenterDroid = string.Empty;
        public static string AppCenterIOS = string.Empty;
        public static string AppCenterUWP = string.Empty;
        public static string BingMapsKey = string.Empty;
#elif PROD
        public static string AppCenterDroid = string.Empty;
        public static string AppCenterIOS = string.Empty;
        public static string AppCenterUWP = string.Empty;
        public static string BingMapsKey = string.Empty;
#else
        public static string AppCenterDroid = string.Empty;
        public static string AppCenterIOS = string.Empty;
        public static string AppCenterUWP = string.Empty;
        public static string BingMapsKey = string.Empty;
#endif
    }
}