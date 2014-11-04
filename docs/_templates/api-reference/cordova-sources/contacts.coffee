# This file is for documenting existing Cordova APIs only.

###
 # @namespace navigator
 # @name connection
 # @overview
 # @description The `connection` object, provided by the  provides information about the device's cellular and wifi connection. It provides an implementation of an old version of the [Network Information API](http://www.w3.org/TR/2011/WD<li>netinfo<li>api<li>20110607/).
It provides information about the device's cellular and Wi<li>Fi connection, including whether the device has an Internet connection.
###

###
 # @namespace navigator.connection
 # @name type
 # @function
 # @description
 # This property offers a fast way to determine the device's network
connection state and type of connection.
 # @usageJavaScript
 # var connectionType = navigator.connection.type;
 # @type
 # navigator.connection.type: ConnectionType
 # @define {ConnectionType} type Connection type, resolves to one of the predefined constants:
 # <ul>
 #   <li>`Connection.UNKNOWN`: Connection type could not be determined.
 #   <li>`Connection.ETHERNET`: Connected via an ethernet cable.
 #   <li>`Connection.WIFI`: Connected via Wi-Fi.
 #   <li>`Connection.CELL_2G`: Connected via 2G cellular data network.
 #   <li>`Connection.CELL_3G`: Connected via 3G cellular data network.
 #   <li>`Connection.CELL_4G`: Connected via 4G cellular data network.
 #   <li>`Connection.CELL`: Connected via generic cellular data network. **iOS quirk**: iOS cannot detect the type of cellular network connection. `navigator.connection.type` is set to `Connection.CELL` for all cellular data connection types.
 #   <li>`Connection.NONE`:
 # </ul>
 # @
 # supersonic.logger.info("Just notifying you that X is going on")
###
