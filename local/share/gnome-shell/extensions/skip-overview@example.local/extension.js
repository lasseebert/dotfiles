import GLib from 'gi://GLib';
import * as Main from 'resource:///org/gnome/shell/ui/main.js';
import { Extension } from 'resource:///org/gnome/shell/extensions/extension.js';

// When GNOME starts, the "Activites Overview" is shown by default. This
// extension will automatically hide it.
export default class SkipOverviewExtension extends Extension {
  enable() {
    this._timeoutId = GLib.timeout_add(GLib.PRIORITY_DEFAULT, 500, () => {
      if (Main.overview.visible) {
        Main.overview.hide();
      }

      this._timeoutId = null;
      return GLib.SOURCE_REMOVE;
    });
  }

  disable() {
    if (this._timeoutId) {
      GLib.Source.remove(this._timeoutId);
      this._timeoutId = null;
    }
  }
}
