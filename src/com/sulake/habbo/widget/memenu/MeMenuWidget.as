package com.sulake.habbo.widget.memenu
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarActionUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarEditorUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetDanceUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetHabboClubUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetPurseUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomEngineUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetSettingsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetToolbarClickedUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetTutorialEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEffectsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetWaveUpdateEvent;
   import com.sulake.habbo.widget.memenu.enum.HabboMeMenuTrackingEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetRequestWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetSelectOutfitMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetToolbarMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.external.ExternalInterface;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getTimer;
   
   public class MeMenuWidget extends RoomWidgetBase
   {
      
      public static const const_118:String = "me_menu_top_view";
      
      public static const const_1717:String = "me_menu_rooms_view";
      
      public static const const_340:String = "me_menu_my_clothes_view";
      
      public static const const_1187:String = "me_menu_dance_moves_view";
      
      public static const const_846:String = "me_menu_effects_view";
      
      public static const const_806:String = "me_menu_settings_view";
      
      public static const const_843:String = "me_menu_sound_settings";
      
      private static const const_1390:int = 5000;
       
      
      private var var_44:IMeMenuView;
      
      private var _mainContainer:IWindowContainer;
      
      private var _eventDispatcher:IEventDispatcher;
      
      private var var_1190:Point;
      
      private var var_1456:int = 0;
      
      private var var_2594:int = 0;
      
      private var var_2593:int = 0;
      
      private var var_2592:Boolean = false;
      
      private var var_1872:int = 0;
      
      private var var_1191:Boolean = false;
      
      private var var_2595:Boolean = false;
      
      private var var_432:Boolean = false;
      
      private var var_2418:int = 0;
      
      private var var_2591:Boolean = false;
      
      private var var_1873:int = 0;
      
      private var var_1596:Boolean = false;
      
      private var _config:IHabboConfigurationManager;
      
      public function MeMenuWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager, param4:IEventDispatcher, param5:IHabboConfigurationManager)
      {
         super(param1,param2,param3);
         this._config = param5;
         this.var_1190 = new Point(0,0);
         this._eventDispatcher = param4;
         if(param5 != null && false)
         {
            this.var_2591 = param5.getKey("client.news.embed.enabled","OfficialRoomListCtrl") == "true";
         }
         this.changeView(const_118);
         this.hide();
      }
      
      override public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         this.hide();
         this._eventDispatcher = null;
         if(this.var_44 != null)
         {
            this.var_44.dispose();
            this.var_44 = null;
         }
         super.dispose();
      }
      
      override public function get mainWindow() : IWindow
      {
         return this._mainContainer;
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetWaveUpdateEvent.const_735,this.onWaveEvent);
         param1.addEventListener(RoomWidgetDanceUpdateEvent.const_883,this.onDanceEvent);
         param1.addEventListener(RoomWidgetUpdateEffectsUpdateEvent.const_924,this.onUpdateEffects);
         param1.addEventListener(RoomWidgetToolbarClickedUpdateEvent.const_935,this.onToolbarClicked);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_663,this.onAvatarEditorClosed);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_858,this.onHideAvatarEditor);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_108,this.onAvatarDeselected);
         param1.addEventListener(RoomWidgetHabboClubUpdateEvent.const_248,this.onHabboClubEvent);
         param1.addEventListener(RoomWidgetAvatarActionUpdateEvent.const_840,this.onAvatarActionEvent);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_129,this.onUserInfo);
         param1.addEventListener(RoomWidgetSettingsUpdateEvent.const_408,this.onSettingsUpdate);
         param1.addEventListener(RoomWidgetTutorialEvent.const_131,this.onTutorialEvent);
         param1.addEventListener(RoomWidgetTutorialEvent.const_451,this.onTutorialEvent);
         param1.addEventListener(RoomWidgetPurseUpdateEvent.const_67,this.onCreditBalance);
         param1.addEventListener(RoomWidgetRoomEngineUpdateEvent.const_94,this.onNormalMode);
         param1.addEventListener(RoomWidgetRoomEngineUpdateEvent.const_369,this.onGameMode);
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetWaveUpdateEvent.const_735,this.onWaveEvent);
         param1.removeEventListener(RoomWidgetDanceUpdateEvent.const_883,this.onDanceEvent);
         param1.removeEventListener(RoomWidgetUpdateEffectsUpdateEvent.const_924,this.onUpdateEffects);
         param1.removeEventListener(RoomWidgetToolbarClickedUpdateEvent.const_935,this.onToolbarClicked);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_108,this.onAvatarDeselected);
         param1.removeEventListener(RoomWidgetHabboClubUpdateEvent.const_248,this.onHabboClubEvent);
         param1.removeEventListener(RoomWidgetAvatarActionUpdateEvent.const_840,this.onAvatarActionEvent);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_663,this.onHideAvatarEditor);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_858,this.onAvatarEditorClosed);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_129,this.onUserInfo);
         param1.removeEventListener(RoomWidgetSettingsUpdateEvent.const_408,this.onSettingsUpdate);
         param1.removeEventListener(RoomWidgetTutorialEvent.const_451,this.onTutorialEvent);
         param1.removeEventListener(RoomWidgetTutorialEvent.const_131,this.onTutorialEvent);
         param1.removeEventListener(RoomWidgetPurseUpdateEvent.const_67,this.onCreditBalance);
         param1.removeEventListener(RoomWidgetRoomEngineUpdateEvent.const_94,this.onNormalMode);
         param1.removeEventListener(RoomWidgetRoomEngineUpdateEvent.const_94,this.onGameMode);
      }
      
      public function hide(param1:RoomWidgetRoomObjectUpdateEvent = null) : void
      {
         var _loc2_:RoomWidgetToolbarMessage = new RoomWidgetToolbarMessage(RoomWidgetToolbarMessage.const_752);
         _loc2_.window = this._mainContainer.parent as IWindowContainer;
         if(messageListener != null)
         {
            messageListener.processWidgetMessage(_loc2_);
         }
         if(this.var_44 != null)
         {
            this._mainContainer.removeChild(this.var_44.window);
            this.var_44.dispose();
            this.var_44 = null;
         }
         this.var_432 = false;
         this._eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_CLOSE));
      }
      
      private function show() : void
      {
         if(!this._mainContainer || !this._mainContainer.parent)
         {
            return;
         }
         this.changeView(const_118);
         var _loc1_:RoomWidgetToolbarMessage = new RoomWidgetToolbarMessage(RoomWidgetToolbarMessage.const_941);
         _loc1_.window = this._mainContainer.parent as IWindowContainer;
         if(messageListener != null)
         {
            messageListener.processWidgetMessage(_loc1_);
         }
         this.var_432 = true;
      }
      
      private function onUserInfo(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         var _loc2_:* = null;
         if(!(this.var_432 && this.var_44.window.name == const_340))
         {
            _loc2_ = new RoomWidgetRequestWidgetMessage(RoomWidgetRequestWidgetMessage.const_939);
            if(messageListener != null)
            {
               if(!this.var_1596)
               {
                  messageListener.processWidgetMessage(_loc2_);
               }
            }
         }
      }
      
      private function onSettingsUpdate(param1:RoomWidgetSettingsUpdateEvent) : void
      {
         if(!this.var_432)
         {
            return;
         }
         if(this.var_44.window.name == const_843)
         {
            (this.var_44 as MeMenuSoundSettingsView).updateSettings(param1);
         }
      }
      
      private function onTutorialEvent(param1:RoomWidgetTutorialEvent) : void
      {
         switch(param1.type)
         {
            case RoomWidgetTutorialEvent.const_451:
               Logger.log("* MeMenuWidget: onHighlightClothesIcon " + this.var_432 + " view: " + this.var_44.window.name);
               if(this.var_432 != true || this.var_44.window.name != const_118)
               {
                  return;
               }
               (this.var_44 as MeMenuMainView).setIconAssets("clothes_icon",const_118,"clothes_highlighter_blue");
               break;
            case RoomWidgetTutorialEvent.const_131:
               this.hide();
         }
      }
      
      private function onToolbarClicked(param1:RoomWidgetToolbarClickedUpdateEvent) : void
      {
         switch(param1.iconType)
         {
            case RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ME_MENU:
               this.var_432 = !this.var_432;
               break;
            case RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ROOM_INFO:
               this.var_432 = false;
               break;
            default:
               return;
         }
         if(this.var_432)
         {
            this.show();
         }
         else
         {
            this.hide();
         }
      }
      
      private function onUpdateEffects(param1:RoomWidgetUpdateEffectsUpdateEvent) : void
      {
         var _loc2_:* = null;
         this.var_1191 = false;
         for each(_loc2_ in param1.effects)
         {
            if(_loc2_.isInUse)
            {
               this.var_1191 = true;
            }
         }
         if(this.var_44 != null && this.var_44.window.name == const_846)
         {
            (this.var_44 as MeMenuEffectsView).updateEffects(param1.effects);
         }
      }
      
      private function onAvatarDeselected(param1:Event) : void
      {
         if(this.var_44 != null && this.var_44.window.name != const_340)
         {
            this.hide();
         }
      }
      
      private function onAvatarEditorClosed(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         if(this.var_44 != null && this.var_44.window.name == const_340)
         {
            this.changeView(const_118);
         }
      }
      
      private function onHideAvatarEditor(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         if(this.var_44 != null && this.var_44.window.name == const_340)
         {
            this.changeView(const_118);
         }
      }
      
      private function onWaveEvent(param1:RoomWidgetWaveUpdateEvent) : void
      {
         Logger.log("[MeMenuWidget] Wave Event received");
      }
      
      private function onDanceEvent(param1:RoomWidgetDanceUpdateEvent) : void
      {
         Logger.log("[MeMenuWidget] Dance Event received, style: " + param1.style);
      }
      
      private function onHabboClubEvent(param1:RoomWidgetHabboClubUpdateEvent) : void
      {
         var _loc2_:* = param1.daysLeft != this.var_1456;
         this.var_1456 = param1.daysLeft;
         this.var_2594 = param1.periodsLeft;
         this.var_2593 = param1.pastPeriods;
         this.var_2592 = param1.allowClubDances;
         _loc2_ = Boolean(_loc2_ || param1.clubLevel != this.var_1872);
         this.var_1872 = param1.clubLevel;
         if(_loc2_)
         {
            if(this.var_44 != null)
            {
               this.changeView(this.var_44.window.name);
            }
         }
      }
      
      private function onAvatarActionEvent(param1:RoomWidgetAvatarActionUpdateEvent) : void
      {
         switch(param1.actionType)
         {
            case RoomWidgetAvatarActionUpdateEvent.EFFECT_ACTIVE:
               this.var_1191 = true;
               break;
            case RoomWidgetAvatarActionUpdateEvent.EFFECT_INACTIVE:
               this.var_1191 = false;
         }
      }
      
      private function onCreditBalance(param1:RoomWidgetPurseUpdateEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         this.var_1873 = param1.balance;
         localizations.registerParameter("widget.memenu.credits","credits",this.var_1873.toString());
      }
      
      private function onNormalMode(param1:RoomWidgetRoomEngineUpdateEvent) : void
      {
         this.var_1596 = false;
      }
      
      private function onGameMode(param1:RoomWidgetRoomEngineUpdateEvent) : void
      {
         this.var_1596 = true;
      }
      
      public function get mainContainer() : IWindowContainer
      {
         if(this._mainContainer == null)
         {
            this._mainContainer = windowManager.createWindow("me_menu_main_container","",HabboWindowType.const_1578,HabboWindowStyle.const_1047,HabboWindowParam.const_45,new Rectangle(0,0,170,260)) as IWindowContainer;
            this._mainContainer.tags.push("room_widget_me_menu");
         }
         return this._mainContainer;
      }
      
      public function changeView(param1:String) : void
      {
         var _loc2_:* = null;
         switch(param1)
         {
            case const_118:
               _loc2_ = new MeMenuMainView();
               this._eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_DEFAULT));
               break;
            case const_846:
               _loc2_ = new MeMenuEffectsView();
               this._eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_EFFECTS));
               break;
            case const_1187:
               _loc2_ = new MeMenuDanceView();
               this._eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_DANCE));
               break;
            case const_340:
               _loc2_ = new MeMenuClothesView();
               break;
            case const_1717:
               _loc2_ = new MeMenuRoomsView();
               break;
            case const_806:
               _loc2_ = new MeMenuSettingsMenuView();
               break;
            case const_843:
               _loc2_ = new MeMenuSoundSettingsView();
               break;
            default:
               Logger.log("Me Menu Change view: unknown view: " + param1);
         }
         if(_loc2_ != null)
         {
            if(this.var_44 != null)
            {
               this._mainContainer.removeChild(this.var_44.window);
               this.var_44.dispose();
               this.var_44 = null;
            }
            this.var_44 = _loc2_;
            this.var_44.init(this,param1);
         }
         this.updateSize();
      }
      
      public function updateSize() : void
      {
         if(this.var_44 != null)
         {
            this.var_1190.x = this.var_44.window.width + 10;
            this.var_1190.y = this.var_44.window.height;
            this.var_44.window.x = 5;
            this.var_44.window.y = 0;
            this._mainContainer.width = this.var_1190.x;
            this._mainContainer.height = this.var_1190.y;
         }
      }
      
      public function get allowHabboClubDances() : Boolean
      {
         return this.var_2592;
      }
      
      public function get isHabboClubActive() : Boolean
      {
         return this.var_1456 > 0;
      }
      
      public function get habboClubDays() : int
      {
         return this.var_1456;
      }
      
      public function get habboClubPeriods() : int
      {
         return this.var_2594;
      }
      
      public function get habboClubPastPeriods() : int
      {
         return this.var_2593;
      }
      
      public function get habboClubLevel() : int
      {
         return this.var_1872;
      }
      
      public function get isNewsEnabled() : Boolean
      {
         return this.var_2591;
      }
      
      public function get creditBalance() : int
      {
         return this.var_1873;
      }
      
      public function get config() : IHabboConfigurationManager
      {
         return this._config;
      }
      
      public function changeToOutfit(param1:int) : void
      {
         this.var_2418 = getTimer();
         this.messageListener.processWidgetMessage(new RoomWidgetSelectOutfitMessage(param1));
      }
      
      public function canChangeOutfit() : Boolean
      {
         var _loc1_:Number = getTimer();
         return _loc1_ - this.var_2418 > const_1390;
      }
      
      public function get hasEffectOn() : Boolean
      {
         return this.var_1191;
      }
      
      public function get isDancing() : Boolean
      {
         return this.var_2595;
      }
      
      public function set isDancing(param1:Boolean) : void
      {
         this.var_2595 = param1;
      }
   }
}
