const string WindowName = Icons::Th + " \\$zBingo";
const string MenuItemName = "\\$ff0" + WindowName;

float PluginTime = 0.0;

void Main() {
    startnew(Font::Init);
    Config::FetchConfig();

    // Plugin was connected to a game when it was forcefully closed or game crashed
    if (Settings::WasConnected || Window::Visible) {
        Network::Init();
    }

    while (true) {
        Network::Loop();
        yield();
    }
}

void RenderMenu() {
    if (UI::MenuItem(MenuItemName, "", Window::Visible)) {
        Window::Visible = !Window::Visible;
        // Connect to server when opening plugin window the first time
        if (Window::Visible && !Network::IsInitialized) {
            startnew(Network::Init);
        }
    }
}

void Render() {
    BoardLocator::Render();
    Board::Draw();
    InfoBar::Render();
    MapList::Render();
}

void RenderInterface() {
    Window::Render();
    SettingsWindow::Render();
}

// TODO: refactor so this is not using the Update callback
void Update(float dt) {
    PluginTime += dt;
    Tick(int(dt));
}
