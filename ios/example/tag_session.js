/* 
 * NFC Tag Viewer Example Application
 * 
 * This application demonstrates how to use the iOS 13+ NFC module.
 *
 * Ensure to include the required entitlements to the <ios> section of your tiapp.xml:
 *
 *   <entitlements>
 *     <dict>
 *       <key>com.apple.developer.nfc.readersession.formats</key>
 *       <array>
 *         <string>NDEF</string>
 *         <string>TAG</string>
 *       </array>
 *     </dict>
 *   </entitlements>
 *
 * Also, ensure to include the NFC-privacy key in your <ios> section of your tiapp.xml
 *
 *    <plist>
 *      <dict>
 *        <!-- Your other Info.plist settings -->
 *        ...
 *        <key>NFCReaderUsageDescription</key>
 *        <string>YOUR_PRIVACY_DESCRIPTION</string>
 *      </dict>
 *    </plist>
 *
 * Finally, ensure to enable the "NFC Tag Reading" capability in your provisioning profile
 * by checking it in the Apple Developer Center (https://developer.apple.com). 
 */

var nfc = require('ti.nfc');
var tagReaderSession = nfc.createTagReaderSession();

tagReaderSession.addEventListener('detect', function (event) {
  console.warn(event);
});

tagReaderSession.addEventListener('error', function (event) {
  console.error(event);
});

var win = Ti.UI.createWindow({
  backgroundColor: '#fff'
});

var btn = Ti.UI.createButton({
  title: 'Start Search'
});

btn.addEventListener('click', function() {
  if (!tagReaderSession.isEnabled()) {
    Ti.API.error('This device does not support NFC capabilities!');
    return;
  }

  tagReaderSession.begin(); // Use "invalidate()" to invalidate a session or "restartPolling()" to restart tag polling.
});

win.add(btn);
win.open();
