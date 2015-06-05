<?php

class BaseController extends Controller {
    
    public function __construct() {
        $menus = \DB::table('menu')->where('parent_id',0)->get();
        foreach($menus as $mn){
            $mn->child = \DB::table('menu')->where('parent_id',$mn->id)->get();
        }
        View::share('menus', $menus);
    }

	/**
	 * Setup the layout used by the controller.
	 *
	 * @return void
	 */
	protected function setupLayout()
	{
		if ( ! is_null($this->layout))
		{
			$this->layout = View::make($this->layout);
		}
	}

}
