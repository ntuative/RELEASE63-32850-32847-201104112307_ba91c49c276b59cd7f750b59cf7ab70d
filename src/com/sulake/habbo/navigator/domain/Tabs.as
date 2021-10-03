package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_381:int = 1;
      
      public static const const_231:int = 2;
      
      public static const const_313:int = 3;
      
      public static const const_363:int = 4;
      
      public static const const_242:int = 5;
      
      public static const const_401:int = 1;
      
      public static const const_714:int = 2;
      
      public static const const_882:int = 3;
      
      public static const const_730:int = 4;
      
      public static const const_240:int = 5;
      
      public static const const_936:int = 6;
      
      public static const const_670:int = 7;
      
      public static const const_255:int = 8;
      
      public static const const_409:int = 9;
      
      public static const const_1941:int = 10;
      
      public static const const_825:int = 11;
      
      public static const const_506:int = 12;
       
      
      private var var_447:Array;
      
      private var _navigator:HabboNavigator;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_447 = new Array();
         this.var_447.push(new Tab(this._navigator,const_381,const_506,new EventsTabPageDecorator(this._navigator),MainViewCtrl.const_488));
         this.var_447.push(new Tab(this._navigator,const_231,const_401,new RoomsTabPageDecorator(this._navigator),MainViewCtrl.const_488));
         this.var_447.push(new Tab(this._navigator,const_363,const_825,new OfficialTabPageDecorator(this._navigator),MainViewCtrl.const_1243));
         this.var_447.push(new Tab(this._navigator,const_313,const_240,new MyRoomsTabPageDecorator(this._navigator),MainViewCtrl.const_488));
         this.var_447.push(new Tab(this._navigator,const_242,const_255,new SearchTabPageDecorator(this._navigator),MainViewCtrl.const_874));
         this.setSelectedTab(const_381);
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_363;
      }
      
      public function get tabs() : Array
      {
         return this.var_447;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         this.getTab(param1).selected = true;
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_447)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_447)
         {
            _loc1_.selected = false;
         }
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_447)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}
