namespace Settings {
    [Setting name="Backend Server URL" category="Debug"]
    string BackendURL = "38.242.214.20";

    [Setting name="Backend TCP Port" category="Debug"]
    uint16 TcpPort = 6899;

    [Setting name="Backend HTTP Port" category="Debug"]
    uint16 HttpPort = 8099;
    
    [Setting name="Connection Timeout" category="Debug"]
    uint ConnectionTimeout = 5000;

    [Setting name="Developer Mode" category="Debug"]
    bool DevMode = false;

    [Setting hidden]
    bool WasConnected = false;
}