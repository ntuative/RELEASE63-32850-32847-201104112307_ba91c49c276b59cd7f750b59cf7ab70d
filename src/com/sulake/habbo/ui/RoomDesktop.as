package com.sulake.habbo.ui
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.runtime.events.EventDispatcher;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IDisplayObjectWrapper;
   import com.sulake.core.window.components.IToolTipWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowStyle;
   import com.sulake.core.window.enum.WindowType;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.advertisement.IAdManager;
   import com.sulake.habbo.avatar.IAvatarRenderManager;
   import com.sulake.habbo.avatar.IHabboAvatarEditor;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.friendlist.IHabboFriendList;
   import com.sulake.habbo.friendlist.events.FriendRequestEvent;
   import com.sulake.habbo.help.IHabboHelp;
   import com.sulake.habbo.inventory.IHabboInventory;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.moderation.IHabboModeration;
   import com.sulake.habbo.navigator.IHabboNavigator;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.RoomVariableEnum;
   import com.sulake.habbo.room.events.RoomEngineEvent;
   import com.sulake.habbo.room.events.RoomEngineObjectEvent;
   import com.sulake.habbo.room.events.RoomEngineSoundMachineEvent;
   import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
   import com.sulake.habbo.room.object.RoomObjectOperationEnum;
   import com.sulake.habbo.room.object.RoomObjectTypeEnum;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.habbo.roomevents.IHabboUserDefinedRoomEvents;
   import com.sulake.habbo.session.IRoomSession;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.session.IUserData;
   import com.sulake.habbo.session.events.RoomSessionEvent;
   import com.sulake.habbo.sound.IHabboSoundManager;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.tracking.IHabboTracking;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.widget.IRoomWidget;
   import com.sulake.habbo.widget.IRoomWidgetFactory;
   import com.sulake.habbo.widget.IRoomWidgetMessageListener;
   import com.sulake.habbo.widget.enums.RoomWidgetEnum;
   import com.sulake.habbo.widget.events.RoomWidgetLoadingBarUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomEngineUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomViewUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetFurniToWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.room.events.RoomContentLoadedEvent;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.utils.ColorConverter;
   import com.sulake.room.utils.IRoomGeometry;
   import com.sulake.room.utils.RoomGeometry;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.display.BitmapDataChannel;
   import flash.display.BlendMode;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.filters.BitmapFilter;
   import flash.filters.BlurFilter;
   import flash.filters.DisplacementMapFilter;
   import flash.filters.DisplacementMapFilterMode;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   
   public class RoomDesktop implements IRoomDesktop, IRoomWidgetMessageListener, IRoomWidgetHandlerContainer
   {
      
      public static const const_813:int = -1;
      
      private static const const_1386:int = 1000;
       
      
      private var _events:EventDispatcher;
      
      private var _windowManager:IHabboWindowManager = null;
      
      private var _roomEngine:IRoomEngine = null;
      
      private var var_1155:IRoomWidgetFactory = null;
      
      private var var_412:ISessionDataManager = null;
      
      private var var_15:IRoomSessionManager = null;
      
      private var var_547:IAvatarRenderManager = null;
      
      private var _friendList:IHabboFriendList = null;
      
      private var _inventory:IHabboInventory = null;
      
      private var var_152:IHabboToolbar = null;
      
      private var _navigator:IHabboNavigator = null;
      
      private var var_1777:IHabboAvatarEditor = null;
      
      private var _catalog:IHabboCatalog = null;
      
      private var var_304:IAdManager = null;
      
      private var _localization:IHabboLocalizationManager = null;
      
      private var var_1141:IHabboHelp = null;
      
      private var _connection:IConnection = null;
      
      private var var_946:IHabboModeration;
      
      private var _config:IHabboConfigurationManager;
      
      private var _soundManager:IHabboSoundManager;
      
      private var _habboTracking:IHabboTracking;
      
      private var var_1154:IHabboUserDefinedRoomEvents;
      
      private var _assets:IAssetLibrary = null;
      
      private var var_31:IRoomSession = null;
      
      private var var_310:Array;
      
      private var var_36:Map;
      
      private var var_779:Map;
      
      private var var_780:Map;
      
      private var var_777:Map;
      
      private var _updateListeners:Array;
      
      private var var_202:DesktopLayoutManager;
      
      private var var_1836:Boolean = true;
      
      private var var_1838:Boolean = true;
      
      private var var_778:Array;
      
      private var var_228:IToolTipWindow;
      
      private var var_2539:uint = 16777215;
      
      private var var_2540:Boolean = false;
      
      private var var_1837:int = 0;
      
      private var var_479:Timer;
      
      private var var_1835:Rectangle;
      
      public function RoomDesktop(param1:IRoomSession, param2:IAssetLibrary, param3:IConnection)
      {
         this.var_310 = [];
         super();
         this._events = new EventDispatcher();
         this.var_31 = param1;
         this._assets = param2;
         this._connection = param3;
         this.var_36 = new Map();
         this.var_779 = new Map();
         this.var_780 = new Map();
         this.var_777 = new Map();
         this.var_202 = new DesktopLayoutManager();
      }
      
      public function get roomSession() : IRoomSession
      {
         return this.var_31;
      }
      
      public function get sessionDataManager() : ISessionDataManager
      {
         return this.var_412;
      }
      
      public function get events() : IEventDispatcher
      {
         return this._events;
      }
      
      public function get roomEngine() : IRoomEngine
      {
         return this._roomEngine;
      }
      
      public function get roomSessionManager() : IRoomSessionManager
      {
         return this.var_15;
      }
      
      public function get friendList() : IHabboFriendList
      {
         return this._friendList;
      }
      
      public function get avatarRenderManager() : IAvatarRenderManager
      {
         return this.var_547;
      }
      
      public function get inventory() : IHabboInventory
      {
         return this._inventory;
      }
      
      public function get toolbar() : IHabboToolbar
      {
         return this.var_152;
      }
      
      public function get roomWidgetFactory() : IRoomWidgetFactory
      {
         return this.var_1155;
      }
      
      public function get navigator() : IHabboNavigator
      {
         return this._navigator;
      }
      
      public function get avatarEditor() : IHabboAvatarEditor
      {
         return this.var_1777;
      }
      
      public function get catalog() : IHabboCatalog
      {
         return this._catalog;
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return this._localization;
      }
      
      public function get habboHelp() : IHabboHelp
      {
         return this.var_1141;
      }
      
      public function get config() : IHabboConfigurationManager
      {
         return this._config;
      }
      
      public function get soundManager() : IHabboSoundManager
      {
         return this._soundManager;
      }
      
      public function get moderation() : IHabboModeration
      {
         return this.var_946;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return this._windowManager;
      }
      
      public function get habboTracking() : IHabboTracking
      {
         return this._habboTracking;
      }
      
      public function get session() : IRoomSession
      {
         return this.var_31;
      }
      
      public function set catalog(param1:IHabboCatalog) : void
      {
         this._catalog = param1;
      }
      
      public function set avatarEditor(param1:IHabboAvatarEditor) : void
      {
         this.var_1777 = param1;
      }
      
      public function set roomWidgetFactory(param1:IRoomWidgetFactory) : void
      {
         this.var_1155 = param1;
      }
      
      public function set sessionDataManager(param1:ISessionDataManager) : void
      {
         this.var_412 = param1;
      }
      
      public function set roomSessionManager(param1:IRoomSessionManager) : void
      {
         this.var_15 = param1;
      }
      
      public function get userDefinedRoomEvents() : IHabboUserDefinedRoomEvents
      {
         return this.var_1154;
      }
      
      public function get connection() : IConnection
      {
         return this._connection;
      }
      
      public function set friendList(param1:IHabboFriendList) : void
      {
         this._friendList = param1;
         if(this._friendList)
         {
            this._friendList.events.addEventListener(FriendRequestEvent.const_62,this.processEvent);
            this._friendList.events.addEventListener(FriendRequestEvent.const_329,this.processEvent);
         }
      }
      
      public function set avatarRenderManager(param1:IAvatarRenderManager) : void
      {
         this.var_547 = param1;
      }
      
      public function set windowManager(param1:IHabboWindowManager) : void
      {
         this._windowManager = param1;
      }
      
      public function set inventory(param1:IHabboInventory) : void
      {
         this._inventory = param1;
      }
      
      public function set navigator(param1:IHabboNavigator) : void
      {
         this._navigator = param1;
      }
      
      public function set adManager(param1:IAdManager) : void
      {
         this.var_304 = param1;
      }
      
      public function set localization(param1:IHabboLocalizationManager) : void
      {
         this._localization = param1;
      }
      
      public function set habboHelp(param1:IHabboHelp) : void
      {
         this.var_1141 = param1;
      }
      
      public function set moderation(param1:IHabboModeration) : void
      {
         this.var_946 = param1;
      }
      
      public function set config(param1:IHabboConfigurationManager) : void
      {
         this._config = param1;
      }
      
      public function set soundManager(param1:IHabboSoundManager) : void
      {
         this._soundManager = param1;
      }
      
      public function set habboTracking(param1:IHabboTracking) : void
      {
         this._habboTracking = param1;
      }
      
      public function set userDefinedRoomEvents(param1:IHabboUserDefinedRoomEvents) : void
      {
         this.var_1154 = param1;
      }
      
      public function set roomEngine(param1:IRoomEngine) : void
      {
         this._roomEngine = param1;
         if(this._roomEngine != null && this._roomEngine.events != null)
         {
            this._roomEngine.events.addEventListener(RoomContentLoadedEvent.const_360,this.onRoomContentLoaded);
            this._roomEngine.events.addEventListener(RoomContentLoadedEvent.const_589,this.onRoomContentLoaded);
            this._roomEngine.events.addEventListener(RoomContentLoadedEvent.const_837,this.onRoomContentLoaded);
         }
      }
      
      public function set toolbar(param1:IHabboToolbar) : void
      {
         this.var_152 = param1;
         this.var_152.events.addEventListener(HabboToolbarEvent.const_528,this.onToolbarRepositionEvent);
         this.var_152.events.addEventListener(HabboToolbarEvent.const_36,this.onHabboToolbarEvent);
      }
      
      public function set layout(param1:XML) : void
      {
         this.var_202.setLayout(param1,this._windowManager,this._config);
         if(this.var_152 != null)
         {
            this.var_202.toolbarSize = this.var_152.size;
            this.var_202.toolbarOrientation = this.var_152.method_1;
         }
      }
      
      public function dispose() : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(this._roomEngine != null && this.var_31 != null)
         {
            _loc2_ = this._roomEngine.getRoomCanvasGeometry(this.var_31.roomId,this.var_31.roomCategory,this.getFirstCanvasId());
            if(_loc2_ != null)
            {
               this.trackZoomTime(_loc2_.isZoomedIn());
            }
         }
         var _loc1_:int = 0;
         if(this.var_310 != null)
         {
            _loc1_ = 0;
            while(_loc1_ < this.var_310.length)
            {
               _loc3_ = this.var_310[_loc1_];
               _loc4_ = this.getWindowName(_loc3_);
               if(this._windowManager)
               {
                  this._windowManager.removeWindow(_loc4_);
               }
               _loc1_++;
            }
         }
         this._updateListeners = null;
         if(this.var_36 != null)
         {
            _loc1_ = 0;
            while(_loc1_ < this.var_36.length)
            {
               _loc5_ = this.var_36.getWithIndex(_loc1_) as IRoomWidget;
               if(_loc5_ != null)
               {
                  _loc5_.dispose();
               }
               _loc1_++;
            }
            this.var_36.dispose();
            this.var_36 = null;
         }
         if(this.var_779 != null)
         {
            _loc1_ = 0;
            while(_loc1_ < this.var_779.length)
            {
               _loc6_ = this.var_779.getWithIndex(_loc1_) as IRoomWidgetHandler;
               if(_loc6_ != null)
               {
                  _loc6_.dispose();
               }
               _loc1_++;
            }
            this.var_779.dispose();
            this.var_779 = null;
         }
         if(this.var_780 != null)
         {
            this.var_780.dispose();
            this.var_780 = null;
         }
         if(this.var_777 != null)
         {
            this.var_777.dispose();
            this.var_777 = null;
         }
         this._assets = null;
         this.var_547 = null;
         this.var_310 = null;
         this._events = null;
         if(this._friendList && this._friendList.events)
         {
            this._friendList.events.removeEventListener(FriendRequestEvent.const_62,this.processEvent);
            this._friendList.events.removeEventListener(FriendRequestEvent.const_329,this.processEvent);
         }
         this._friendList = null;
         this.var_202.dispose();
         this.var_202 = null;
         if(this._roomEngine != null && this._roomEngine.events != null)
         {
            this._roomEngine.events.removeEventListener(RoomContentLoadedEvent.const_360,this.onRoomContentLoaded);
            this._roomEngine.events.removeEventListener(RoomContentLoadedEvent.const_589,this.onRoomContentLoaded);
            this._roomEngine.events.removeEventListener(RoomContentLoadedEvent.const_837,this.onRoomContentLoaded);
         }
         this._roomEngine = null;
         this.var_15 = null;
         this.var_1155 = null;
         this.var_31 = null;
         this.var_412 = null;
         this._windowManager = null;
         this._inventory = null;
         if(this.var_152 && this.var_152.events)
         {
            this.var_152.events.removeEventListener(HabboToolbarEvent.const_528,this.onToolbarRepositionEvent);
            this.var_152.events.removeEventListener(HabboToolbarEvent.const_36,this.onHabboToolbarEvent);
         }
         this.var_152 = null;
         this._localization = null;
         this._config = null;
         this._soundManager = null;
         if(this.var_228 != null)
         {
            this.var_228.dispose();
            this.var_228 = null;
         }
         if(this.var_479 != null)
         {
            this.var_479.reset();
            this.var_479.removeEventListener(TimerEvent.TIMER,this.onResizeTimerEvent);
            this.var_479 = null;
         }
         this.var_1835 = null;
      }
      
      public function init() : void
      {
         if(this._roomEngine != null && this.var_31 != null)
         {
            this.var_778 = this._roomEngine.loadRoomResources(this.var_31.roomResources);
            if(this.var_778.length > 0)
            {
               this.var_1838 = false;
               this.processEvent(new RoomWidgetLoadingBarUpdateEvent(RoomWidgetLoadingBarUpdateEvent.const_110));
            }
         }
         if(this.var_304 != null && this.var_31.state == RoomSessionEvent.const_270)
         {
            this.var_1836 = !this.var_304.showInterstitial();
         }
         this.checkInterrupts();
      }
      
      private function onRoomContentLoaded(param1:RoomContentLoadedEvent) : void
      {
         if(this.var_778 == null || this.var_778.length == 0)
         {
            return;
         }
         var _loc2_:int = this.var_778.indexOf(param1.contentType);
         if(_loc2_ != -1)
         {
            this.var_778.splice(_loc2_,1);
         }
         if(this.var_778.length == 0)
         {
            this.var_1838 = true;
            this.checkInterrupts();
         }
      }
      
      public function createWidget(param1:String) : void
      {
         var _loc2_:* = null;
         var _loc3_:Boolean = false;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         if(this.var_1155 == null)
         {
            return;
         }
         _loc2_ = this.var_1155.createWidget(param1);
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.messageListener = this;
         _loc2_.registerUpdateEvents(this._events);
         this.var_202.addWidgetWindow(param1,_loc2_.mainWindow);
         if(!this.var_36.add(param1,_loc2_))
         {
            _loc2_.dispose();
         }
         switch(param1)
         {
            case RoomWidgetEnum.const_423:
               _loc5_ = new ChatWidgetHandler();
               _loc5_.connection = this._connection;
               _loc4_ = _loc5_ as IRoomWidgetHandler;
               break;
            case RoomWidgetEnum.const_586:
               _loc4_ = new InfoStandWidgetHandler(this._soundManager.musicController);
               break;
            case RoomWidgetEnum.CHAT_INPUT_WIDGET:
               _loc3_ = true;
               _loc4_ = new ChatInputWidgetHandler();
               break;
            case RoomWidgetEnum.const_501:
               _loc4_ = new MeMenuWidgetHandler();
               break;
            case RoomWidgetEnum.const_921:
               _loc4_ = new PlaceholderWidgetHandler();
               break;
            case RoomWidgetEnum.const_566:
               _loc4_ = new FurnitureCreditWidgetHandler();
               break;
            case RoomWidgetEnum.const_505:
               _loc4_ = new FurnitureStickieWidgetHandler();
               break;
            case RoomWidgetEnum.const_511:
               _loc4_ = new FurniturePresentWidgetHandler();
               break;
            case RoomWidgetEnum.const_513:
               _loc4_ = new FurnitureTrophyWidgetHandler();
               break;
            case RoomWidgetEnum.const_447:
               _loc4_ = new FurnitureTeaserWidgetHandler();
               break;
            case RoomWidgetEnum.const_487:
               _loc4_ = new FurnitureEcotronBoxWidgetHandler();
               break;
            case RoomWidgetEnum.const_551:
               _loc4_ = new PetPackageFurniWidgetHandler();
               break;
            case RoomWidgetEnum.const_119:
               _loc4_ = new DoorbellWidgetHandler();
               break;
            case RoomWidgetEnum.const_666:
               _loc4_ = new RoomQueueWidgetHandler();
               break;
            case RoomWidgetEnum.const_468:
               _loc4_ = new LoadingBarWidgetHandler();
               break;
            case RoomWidgetEnum.const_116:
               _loc4_ = new VoteWidgetHandler();
               break;
            case RoomWidgetEnum.const_392:
               _loc4_ = new PollWidgetHandler();
               break;
            case RoomWidgetEnum.const_610:
               _loc4_ = new FurniChooserWidgetHandler();
               break;
            case RoomWidgetEnum.const_299:
               _loc4_ = new UserChooserWidgetHandler();
               break;
            case RoomWidgetEnum.const_557:
               _loc4_ = new FurnitureDimmerWidgetHandler();
               break;
            case RoomWidgetEnum.const_141:
               _loc4_ = new FriendRequestWidgetHandler();
               break;
            case RoomWidgetEnum.const_600:
               _loc4_ = new FurnitureClothingChangeWidgetHandler();
               break;
            case RoomWidgetEnum.const_925:
               _loc4_ = new ConversionPointWidgetHandler();
               break;
            case RoomWidgetEnum.const_120:
               _loc4_ = new UserNotificationWidgetHandler();
               break;
            case RoomWidgetEnum.const_359:
               _loc4_ = new PurseWidgetHandler();
               break;
            case RoomWidgetEnum.const_117:
               _loc4_ = new AvatarInfoWidgetHandler();
               break;
            case RoomWidgetEnum.const_463:
               _loc4_ = new WelcomeGiftWidgetHandler();
               break;
            case RoomWidgetEnum.const_455:
               _loc6_ = new PlayListEditorWidgetHandler();
               _loc6_.connection = this._connection;
               _loc4_ = _loc6_ as IRoomWidgetHandler;
               break;
            case RoomWidgetEnum.const_480:
               _loc4_ = new RoomInfoWidgetHandler();
         }
         if(_loc4_ != null)
         {
            _loc4_.container = this;
            if(!this.var_779.add(param1,_loc4_))
            {
               _loc4_.dispose();
            }
            _loc7_ = null;
            _loc8_ = _loc4_.getWidgetMessages();
            if(_loc8_ != null)
            {
               for each(_loc10_ in _loc8_)
               {
                  _loc7_ = this.var_780.getValue(_loc10_);
                  if(_loc7_ == null)
                  {
                     _loc7_ = [];
                     this.var_780.add(_loc10_,_loc7_);
                  }
                  else
                  {
                     Logger.log("Room widget message \'" + _loc10_ + "\' handled by more than one widget message handler, could cause problems. Be careful!");
                  }
                  _loc7_.push(_loc4_);
               }
            }
            _loc9_ = _loc4_.getProcessedEvents();
            if(_loc9_ != null)
            {
               for each(_loc11_ in _loc9_)
               {
                  _loc7_ = this.var_777.getValue(_loc11_);
                  if(_loc7_ == null)
                  {
                     _loc7_ = [];
                     this.var_777.add(_loc11_,_loc7_);
                  }
                  _loc7_.push(_loc4_);
               }
            }
         }
         if(_loc3_)
         {
            param1 = "null";
            _loc12_ = new RoomWidgetRoomViewUpdateEvent(param1,this.var_202.roomViewRect);
            this.events.dispatchEvent(_loc12_);
         }
      }
      
      public function processWidgetMessage(param1:RoomWidgetMessage) : RoomWidgetUpdateEvent
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:Array = this.var_780.getValue(param1.type);
         if(_loc2_ != null)
         {
            for each(_loc3_ in _loc2_)
            {
               _loc4_ = _loc3_.processWidgetMessage(param1);
               if(_loc4_ != null)
               {
                  return _loc4_;
               }
            }
         }
         return null;
      }
      
      public function processEvent(param1:Event) : void
      {
         var _loc3_:* = null;
         if(!param1)
         {
            return;
         }
         var _loc2_:Array = this.var_777.getValue(param1.type);
         if(_loc2_ != null)
         {
            for each(_loc3_ in _loc2_)
            {
               _loc3_.processEvent(param1);
            }
         }
      }
      
      public function roomObjectEventHandler(param1:RoomEngineObjectEvent) : void
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         if(param1 == null)
         {
            return;
         }
         var _loc2_:int = int(param1.objectId);
         var _loc3_:int = int(param1.category);
         var _loc4_:* = null;
         var _loc5_:* = null;
         switch(param1.type)
         {
            case RoomEngineObjectEvent.const_656:
               _loc4_ = new RoomWidgetRoomObjectUpdateEvent(RoomWidgetRoomObjectUpdateEvent.const_235,_loc2_,_loc3_,param1.roomId,param1.roomCategory);
               if(this.var_946 != null && _loc3_ == RoomObjectCategoryEnum.const_34)
               {
                  _loc7_ = this.var_31.userDataManager.getUserDataByIndex(_loc2_);
                  if(_loc7_ != null && _loc7_.type == RoomObjectTypeEnum.const_197)
                  {
                     this.var_946.userSelected(_loc7_.webID,_loc7_.name);
                  }
               }
               break;
            case RoomEngineObjectEvent.const_405:
               switch(_loc3_)
               {
                  case RoomObjectCategoryEnum.const_28:
                  case RoomObjectCategoryEnum.const_25:
                     _loc6_ = "null";
                     break;
                  case RoomObjectCategoryEnum.const_34:
                     _loc6_ = "null";
               }
               if(_loc6_ != null)
               {
                  _loc4_ = new RoomWidgetRoomObjectUpdateEvent(_loc6_,_loc2_,_loc3_,param1.roomId,param1.roomCategory);
               }
               break;
            case RoomEngineObjectEvent.const_785:
               switch(_loc3_)
               {
                  case RoomObjectCategoryEnum.const_28:
                  case RoomObjectCategoryEnum.const_25:
                     _loc6_ = "null";
                     break;
                  case RoomObjectCategoryEnum.const_34:
                     _loc6_ = "null";
               }
               if(_loc6_ != null)
               {
                  _loc4_ = new RoomWidgetRoomObjectUpdateEvent(_loc6_,_loc2_,_loc3_,param1.roomId,param1.roomCategory);
               }
               break;
            case RoomEngineObjectEvent.const_599:
               _loc4_ = new RoomWidgetRoomObjectUpdateEvent(RoomWidgetRoomObjectUpdateEvent.const_108,_loc2_,_loc3_,param1.roomId,param1.roomCategory);
               break;
            case RoomEngineObjectEvent.const_746:
               if(!this.var_31.isRoomController && !this.var_412.isAnyRoomController)
               {
                  return;
               }
               this._roomEngine.modifyRoomObject(param1.objectId,param1.category,RoomObjectOperationEnum.OBJECT_MOVE);
               break;
            case RoomEngineObjectEvent.ROOM_OBJECT_WIDGET_REQUEST_CREDITFURNI:
               _loc5_ = new RoomWidgetFurniToWidgetMessage(RoomWidgetFurniToWidgetMessage.const_912,_loc2_,_loc3_,param1.roomId,param1.roomCategory);
               this.processWidgetMessage(_loc5_);
               break;
            case RoomEngineObjectEvent.const_144:
               _loc5_ = new RoomWidgetFurniToWidgetMessage(RoomWidgetFurniToWidgetMessage.const_895,_loc2_,_loc3_,param1.roomId,param1.roomCategory);
               this.processWidgetMessage(_loc5_);
               break;
            case RoomEngineObjectEvent.const_137:
               _loc5_ = new RoomWidgetFurniToWidgetMessage(RoomWidgetFurniToWidgetMessage.const_776,_loc2_,_loc3_,param1.roomId,param1.roomCategory);
               this.processWidgetMessage(_loc5_);
               break;
            case RoomEngineObjectEvent.ROOM_OBJECT_WIDGET_REQUEST_TROPHY:
               _loc5_ = new RoomWidgetFurniToWidgetMessage(RoomWidgetFurniToWidgetMessage.const_897,_loc2_,_loc3_,param1.roomId,param1.roomCategory);
               this.processWidgetMessage(_loc5_);
               break;
            case RoomEngineObjectEvent.const_149:
               _loc5_ = new RoomWidgetFurniToWidgetMessage(RoomWidgetFurniToWidgetMessage.const_777,_loc2_,_loc3_,param1.roomId,param1.roomCategory);
               this.processWidgetMessage(_loc5_);
               break;
            case RoomEngineObjectEvent.const_143:
               _loc5_ = new RoomWidgetFurniToWidgetMessage(RoomWidgetFurniToWidgetMessage.const_877,_loc2_,_loc3_,param1.roomId,param1.roomCategory);
               this.processWidgetMessage(_loc5_);
               break;
            case RoomEngineObjectEvent.const_135:
               _loc5_ = new RoomWidgetFurniToWidgetMessage(RoomWidgetFurniToWidgetMessage.const_940,_loc2_,_loc3_,param1.roomId,param1.roomCategory);
               this.processWidgetMessage(_loc5_);
               break;
            case RoomEngineObjectEvent.const_159:
               _loc5_ = new RoomWidgetFurniToWidgetMessage(RoomWidgetFurniToWidgetMessage.const_1124,_loc2_,_loc3_,param1.roomId,param1.roomCategory);
               this.processWidgetMessage(_loc5_);
               break;
            case RoomEngineObjectEvent.const_478:
            case RoomEngineObjectEvent.const_608:
               this.handleRoomAdClick(param1);
               break;
            case RoomEngineObjectEvent.const_519:
            case RoomEngineObjectEvent.const_470:
               this.handleRoomAdTooltip(param1);
               break;
            case RoomEngineObjectEvent.const_109:
               this.processEvent(param1);
               break;
            case RoomEngineObjectEvent.const_152:
               _loc5_ = new RoomWidgetFurniToWidgetMessage(RoomWidgetFurniToWidgetMessage.const_934,_loc2_,_loc3_,param1.roomId,param1.roomCategory);
               this.processWidgetMessage(_loc5_);
               break;
            case RoomEngineObjectEvent.const_158:
               _loc5_ = new RoomWidgetFurniToWidgetMessage(RoomWidgetFurniToWidgetMessage.const_866,_loc2_,_loc3_,param1.roomId,param1.roomCategory);
               this.processWidgetMessage(_loc5_);
               break;
            case RoomEngineSoundMachineEvent.const_276:
               this.processEvent(param1);
         }
         if(_loc4_ != null)
         {
            this.events.dispatchEvent(_loc4_);
         }
      }
      
      public function method_3(param1:RoomEngineEvent) : void
      {
         var _loc2_:* = null;
         switch(param1.type)
         {
            case RoomEngineEvent.const_475:
               _loc2_ = new RoomWidgetRoomEngineUpdateEvent(RoomWidgetRoomEngineUpdateEvent.const_94,param1.roomId,param1.roomCategory);
               break;
            case RoomEngineEvent.const_484:
               _loc2_ = new RoomWidgetRoomEngineUpdateEvent(RoomWidgetRoomEngineUpdateEvent.const_369,param1.roomId,param1.roomCategory);
         }
         if(_loc2_ != null)
         {
            this.events.dispatchEvent(_loc2_);
         }
      }
      
      public function createRoomView(param1:int) : void
      {
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:* = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:* = null;
         var _loc2_:Rectangle = this.var_202.roomViewRect;
         var _loc3_:int = _loc2_.width;
         var _loc4_:int = _loc2_.height;
         var _loc5_:int = 0;
         if(this.var_310.indexOf(param1) >= 0)
         {
            return;
         }
         if(this.var_31 == null || this._windowManager == null || this._roomEngine == null)
         {
            return;
         }
         var _loc6_:DisplayObject = this._roomEngine.createRoomCanvas(this.var_31.roomId,this.var_31.roomCategory,param1,_loc3_,_loc4_,_loc5_);
         if(_loc6_ == null)
         {
            return;
         }
         var _loc7_:RoomGeometry = this._roomEngine.getRoomCanvasGeometry(this.var_31.roomId,this.var_31.roomCategory,param1) as RoomGeometry;
         if(_loc7_ != null)
         {
            _loc13_ = this._roomEngine.getRoomNumberValue(this.var_31.roomId,this.var_31.roomCategory,RoomVariableEnum.const_839);
            _loc14_ = this._roomEngine.getRoomNumberValue(this.var_31.roomId,this.var_31.roomCategory,RoomVariableEnum.const_716);
            _loc15_ = this._roomEngine.getRoomNumberValue(this.var_31.roomId,this.var_31.roomCategory,RoomVariableEnum.const_748);
            _loc16_ = this._roomEngine.getRoomNumberValue(this.var_31.roomId,this.var_31.roomCategory,RoomVariableEnum.const_817);
            _loc17_ = (_loc13_ + _loc14_) / 2;
            _loc18_ = (_loc15_ + _loc16_) / 2;
            _loc19_ = 20;
            _loc17_ += _loc19_ - 1;
            _loc18_ += _loc19_ - 1;
            _loc20_ = Math.sqrt(_loc19_ * _loc19_ + _loc19_ * _loc19_) * Math.tan(0);
            _loc7_.location = new Vector3d(_loc17_,_loc18_,_loc20_);
         }
         var _loc8_:XmlAsset = this._assets.getAssetByName("room_view_container_xml") as XmlAsset;
         if(_loc8_ == null)
         {
            return;
         }
         var _loc9_:IWindowContainer = this._windowManager.buildFromXML(_loc8_.content as XML) as IWindowContainer;
         if(_loc9_ == null)
         {
            return;
         }
         _loc9_.width = _loc3_;
         _loc9_.height = _loc4_;
         var _loc10_:IDisplayObjectWrapper = _loc9_.findChildByName("room_canvas_wrapper") as IDisplayObjectWrapper;
         if(_loc10_ == null)
         {
            return;
         }
         _loc10_.setDisplayObject(_loc6_);
         _loc10_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.canvasMouseHandler);
         _loc10_.addEventListener(WindowMouseEvent.const_168,this.canvasMouseHandler);
         _loc10_.addEventListener(WindowMouseEvent.const_214,this.canvasMouseHandler);
         _loc10_.addEventListener(WindowMouseEvent.const_42,this.canvasMouseHandler);
         _loc10_.addEventListener(WindowMouseEvent.const_56,this.canvasMouseHandler);
         _loc10_.addEventListener(WindowMouseEvent.const_191,this.canvasMouseHandler);
         _loc10_.addEventListener(WindowEvent.const_39,this.onRoomViewResized);
         var _loc11_:Sprite = new Sprite();
         _loc11_.mouseEnabled = false;
         _loc11_.blendMode = BlendMode.MULTIPLY;
         _loc10_ = _loc9_.findChildByName("colorizer_wrapper") as IDisplayObjectWrapper;
         if(_loc10_ == null)
         {
            return;
         }
         _loc10_.setDisplayObject(_loc11_);
         _loc10_.addEventListener(WindowEvent.const_39,this.resizeColorizer);
         if(this.var_31.isSpectatorMode)
         {
            _loc21_ = this.getSpectatorModeVisualization();
            if(_loc21_ != null)
            {
               _loc21_.width = _loc9_.width;
               _loc21_.height = _loc9_.height;
               _loc9_.addChild(_loc21_);
            }
         }
         this.var_202.addRoomView(_loc9_);
         this.var_310.push(param1);
         var _loc12_:String = this._roomEngine.getWorldType(this.var_31.roomId,this.var_31.roomCategory);
         if(!this._roomEngine.isPublicRoomWorldType(_loc12_))
         {
            this.var_2540 = true;
            this.var_1837 = getTimer();
         }
      }
      
      private function resizeColorizer(param1:WindowEvent) : void
      {
         var _loc2_:IDisplayObjectWrapper = param1.target as IDisplayObjectWrapper;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:Sprite = _loc2_.getDisplayObject() as Sprite;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.graphics.clear();
         _loc3_.graphics.beginFill(this.var_2539);
         _loc3_.graphics.drawRect(0,0,_loc2_.width,_loc2_.height);
         _loc3_.graphics.endFill();
      }
      
      public function setRoomViewColor(param1:uint, param2:int) : void
      {
         var _loc3_:IWindowContainer = this.var_202.getRoomView() as IWindowContainer;
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:IDisplayObjectWrapper = _loc3_.getChildByName("colorizer_wrapper") as IDisplayObjectWrapper;
         if(_loc4_ == null)
         {
            return;
         }
         var _loc5_:Sprite = _loc4_.getDisplayObject() as Sprite;
         if(_loc5_ == null)
         {
            return;
         }
         var _loc6_:int = ColorConverter.rgbToHSL(param1);
         _loc6_ = (_loc6_ & 16776960) + param2;
         param1 = ColorConverter.hslToRGB(_loc6_);
         this.var_2539 = param1;
         _loc5_.graphics.clear();
         _loc5_.graphics.beginFill(param1);
         _loc5_.graphics.drawRect(0,0,_loc4_.width,_loc4_.height);
         _loc5_.graphics.endFill();
      }
      
      public function getFirstCanvasId() : int
      {
         if(this.var_310 != null)
         {
            if(this.var_310.length > 0)
            {
               return this.var_310[0];
            }
         }
         return 0;
      }
      
      public function getRoomViewRect() : Rectangle
      {
         if(!this.var_202)
         {
            return null;
         }
         return this.var_202.roomViewRect;
      }
      
      public function canvasMouseHandler(param1:WindowEvent) : void
      {
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:* = null;
         if(this._roomEngine == null || this.var_31 == null)
         {
            return;
         }
         var _loc2_:WindowMouseEvent = param1 as WindowMouseEvent;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:String = "";
         switch(_loc2_.type)
         {
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK:
               _loc3_ = "null";
               break;
            case WindowMouseEvent.const_168:
               _loc3_ = "null";
               break;
            case WindowMouseEvent.const_42:
               _loc3_ = "null";
               break;
            case WindowMouseEvent.const_56:
            case WindowMouseEvent.const_191:
               _loc3_ = "null";
               break;
            case WindowMouseEvent.const_214:
               _loc3_ = "null";
               break;
            default:
               return;
         }
         var _loc4_:IDisplayObjectWrapper = _loc2_.target as IDisplayObjectWrapper;
         if(_loc4_ == _loc2_.target)
         {
            _loc5_ = new Point();
            _loc4_.getGlobalPosition(_loc5_);
            _loc6_ = _loc2_.stageX - _loc5_.x;
            _loc7_ = _loc2_.stageY - _loc5_.y;
            this._roomEngine.setActiveRoom(this.var_31.roomId,this.var_31.roomCategory);
            this._roomEngine.handleRoomCanvasMouseEvent(this.var_310[0],_loc6_,_loc7_,_loc3_,_loc2_.altKey,_loc2_.ctrlKey,_loc2_.shiftKey,_loc2_.buttonDown);
         }
         if(_loc3_ == MouseEvent.MOUSE_MOVE && this.var_228 != null)
         {
            _loc8_ = new Point(_loc2_.stageX,_loc2_.stageY);
            _loc8_.offset(-this.var_228.width / 2,15);
            this.var_228.setGlobalPosition(_loc8_);
         }
      }
      
      private function onRoomViewResized(param1:WindowEvent) : void
      {
         var _loc2_:IWindow = param1.window;
         this.var_1835 = _loc2_.rectangle;
         this._roomEngine.modifyRoomCanvas(this.var_31.roomId,this.var_31.roomCategory,this.var_310[0],_loc2_.width,_loc2_.height);
         if(this.var_479 == null)
         {
            this.var_479 = new Timer(const_1386,1);
            this.var_479.addEventListener(TimerEvent.TIMER,this.onResizeTimerEvent);
         }
         else
         {
            this.var_479.reset();
         }
         this.var_479.start();
      }
      
      private function onResizeTimerEvent(param1:TimerEvent) : void
      {
         var _loc2_:String = "null";
         this.events.dispatchEvent(new RoomWidgetRoomViewUpdateEvent(_loc2_,this.var_1835));
      }
      
      private function onToolbarRepositionEvent(param1:HabboToolbarEvent) : void
      {
         if(this.var_202 != null)
         {
            this.var_202.toolbarOrientation = param1.method_1;
         }
      }
      
      private function trackZoomTime(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(this.var_2540)
         {
            _loc2_ = getTimer();
            _loc3_ = Math.round((_loc2_ - this.var_1837) / 1000);
            if(this._habboTracking != null)
            {
               if(param1)
               {
                  this._habboTracking.track("zoomEnded","in",_loc3_);
               }
               else
               {
                  this._habboTracking.track("zoomEnded","out",_loc3_);
               }
            }
            this.var_1837 = _loc2_;
         }
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(param1.iconId == HabboToolbarIconEnum.ZOOM)
         {
            if(this.var_31 != null)
            {
               _loc2_ = this._roomEngine.getRoomCanvasGeometry(this.var_31.roomId,this.var_31.roomCategory,this.getFirstCanvasId());
               if(_loc2_ != null)
               {
                  this.trackZoomTime(_loc2_.isZoomedIn());
                  _loc2_.performZoom();
                  _loc3_ = new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_97,HabboToolbarIconEnum.ZOOM);
                  if(_loc2_.isZoomedIn())
                  {
                     _loc3_.iconState = "2";
                     this.var_152.events.dispatchEvent(_loc3_);
                  }
                  else
                  {
                     _loc3_.iconState = "0";
                     this.var_152.events.dispatchEvent(_loc3_);
                  }
               }
            }
         }
      }
      
      public function update() : void
      {
         var _loc3_:* = null;
         if(this._updateListeners == null)
         {
            return;
         }
         var _loc1_:int = this._updateListeners.length;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            _loc3_ = this._updateListeners.getWithIndex(_loc2_) as IRoomWidgetHandler;
            if(_loc3_ != null)
            {
               _loc3_.update();
            }
            _loc2_++;
         }
      }
      
      private function getWindowName(param1:int) : String
      {
         return "Room_Engine_Window_" + param1;
      }
      
      private function createFilter(param1:int, param2:int) : Array
      {
         var _loc3_:BlurFilter = new BlurFilter(2,2);
         return [];
      }
      
      private function getBitmapFilter(param1:int, param2:int) : BitmapFilter
      {
         var _loc3_:BitmapData = new BitmapData(param1,param2);
         _loc3_.perlinNoise(param1,param2,5,Math.random() * 2000000000,true,false);
         var _loc4_:Point = new Point(0,0);
         var _loc5_:int = 0;
         var _loc6_:uint = _loc5_;
         var _loc7_:uint = _loc5_;
         var _loc8_:Number = param1 / 20;
         var _loc9_:Number = -param1 / 25;
         var _loc10_:String = "null";
         return new DisplacementMapFilter(_loc3_,_loc4_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_,0,0);
      }
      
      public function checkInterrupts() : void
      {
         if(this.var_15 != null && this.var_31 != null && this.var_1836 && this.var_1838)
         {
            this.var_15.startSession(this.var_31);
            this.processEvent(new RoomWidgetLoadingBarUpdateEvent(RoomWidgetLoadingBarUpdateEvent.const_317));
         }
      }
      
      public function setInterstitialCompleted() : void
      {
         this.var_1836 = true;
         this.checkInterrupts();
      }
      
      private function handleRoomAdClick(param1:RoomEngineObjectEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:IRoomObject = this._roomEngine.getRoomObject(param1.roomId,param1.roomCategory,param1.objectId,param1.category);
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:IRoomObjectModel = _loc2_.getModel() as IRoomObjectModel;
         var _loc4_:String = _loc3_.getString(RoomObjectVariableEnum.const_413);
         if(_loc4_ == null || _loc4_.indexOf("http") != 0)
         {
            return;
         }
         switch(param1.type)
         {
            case RoomEngineObjectEvent.const_478:
               if(this.var_31.isRoomController || this.var_412.isAnyRoomController)
               {
                  return;
               }
               HabboWebTools.openWebPage(_loc4_);
               break;
            case RoomEngineObjectEvent.const_608:
               if(!this.var_31.isRoomController && !this.var_412.isAnyRoomController)
               {
                  return;
               }
               HabboWebTools.openWebPage(_loc4_);
               break;
         }
      }
      
      private function handleRoomAdTooltip(param1:RoomEngineObjectEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(param1 == null)
         {
            return;
         }
         switch(param1.type)
         {
            case RoomEngineObjectEvent.const_519:
               if(this.var_228 != null)
               {
                  return;
               }
               _loc2_ = this._roomEngine.getRoomObject(param1.roomId,param1.roomCategory,param1.objectId,param1.category);
               if(_loc2_ == null)
               {
                  return;
               }
               _loc3_ = this._localization.getKey(_loc2_.getType() + ".tooltip","${ads.roomad.tooltip}");
               this.var_228 = this._windowManager.createWindow("room_ad_tooltip",_loc3_,WindowType.const_419,WindowStyle.const_943,WindowParam.const_102) as IToolTipWindow;
               this.var_228.setParamFlag(WindowParam.const_31,false);
               this.var_228.visible = true;
               this.var_228.center();
               break;
            case RoomEngineObjectEvent.const_470:
               if(this.var_228 == null)
               {
                  return;
               }
               this.var_228.dispose();
               this.var_228 = null;
               break;
         }
      }
      
      private function getSpectatorModeVisualization() : IWindow
      {
         var _loc1_:XmlAsset = this._assets.getAssetByName("spectator_mode_xml") as XmlAsset;
         if(_loc1_ == null)
         {
            return null;
         }
         var _loc2_:IWindowContainer = this._windowManager.buildFromXML(_loc1_.content as XML) as IWindowContainer;
         if(_loc2_ == null)
         {
            return null;
         }
         this.setBitmap(_loc2_.findChildByName("top_left"),"spec_top_left_png");
         this.setBitmap(_loc2_.findChildByName("top_middle"),"spec_top_middle_png");
         this.setBitmap(_loc2_.findChildByName("top_right"),"spec_top_right_png");
         this.setBitmap(_loc2_.findChildByName("middle_left"),"spec_middle_left_png");
         this.setBitmap(_loc2_.findChildByName("middle_right"),"spec_middle_right_png");
         this.setBitmap(_loc2_.findChildByName("bottom_left"),"spec_bottom_left_png");
         this.setBitmap(_loc2_.findChildByName("bottom_middle"),"spec_bottom_middle_png");
         this.setBitmap(_loc2_.findChildByName("bottom_right"),"spec_bottom_right_png");
         return _loc2_;
      }
      
      private function setBitmap(param1:IWindow, param2:String) : void
      {
         var _loc3_:IBitmapWrapperWindow = param1 as IBitmapWrapperWindow;
         if(_loc3_ == null || this._assets == null)
         {
            return;
         }
         var _loc4_:BitmapDataAsset = this._assets.getAssetByName(param2) as BitmapDataAsset;
         if(_loc4_ == null)
         {
            return;
         }
         var _loc5_:BitmapData = _loc4_.content as BitmapData;
         if(_loc5_ == null)
         {
            return;
         }
         _loc3_.bitmap = _loc5_.clone();
      }
      
      public function initializeWidget(param1:String, param2:int = 0) : void
      {
         var _loc3_:IRoomWidget = this.var_36[param1];
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.initialize(param2);
      }
      
      public function getWidgetState(param1:String) : int
      {
         var _loc2_:IRoomWidget = this.var_36[param1];
         if(_loc2_ == null)
         {
            return const_813;
         }
         return _loc2_.state;
      }
      
      public function addUpdateListener(param1:IRoomWidgetHandler) : void
      {
         if(this._updateListeners == null)
         {
            this._updateListeners = new Array();
         }
         if(this._updateListeners.indexOf(param1) == -1)
         {
            this._updateListeners.push(param1);
         }
      }
      
      public function removeUpdateListener(param1:IRoomWidgetHandler) : void
      {
         if(this._updateListeners == null)
         {
            return;
         }
         var _loc2_:int = this._updateListeners.indexOf(param1);
         if(_loc2_ != -1)
         {
            this._updateListeners.splice(_loc2_,1);
         }
      }
   }
}
