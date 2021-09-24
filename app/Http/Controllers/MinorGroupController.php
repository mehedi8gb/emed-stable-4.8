<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\minor_group_id;
use Illuminate\Routing\Redirector;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Str;

class MinorGroupController extends Controller
{
    public function index()
    {
        $minor_group = minor_group_id::paginate(20);
        // $minor_group = $minor_group->paginate(15);
        return view('backend.product.minor_group.index', compact('minor_group'));
    }
    public function create()
    {
        $minor_group = minor_group_id::all();
        return view('backend.product.minor_group.create', compact('minor_group'));
    }
    public function store(Request $request)
    {
        $minor_group = new minor_group_id;
        $minor_group->name = $request->name;
        $minor_group->type = $request->type;
        $minor_group->meta = $request->meta;
        $minor_group->icon = $request->icon;

        if ($request->slug != null) {
            $minor_group->slug = preg_replace('/[^A-Za-z0-9\-]/', '', str_replace(' ', '-', $request->slug));
        }
        else {
            $minor_group->slug = preg_replace('/[^A-Za-z0-9\-]/', '', str_replace(' ', '-', $request->name)).'-'.Str::random(5);
        }
        $minor_group->save();

        // $minor_group->experience = $request->experience;
        // $minor_group->salary = $request->salary;
        flash(translate('minor group has been inserted successfully'))->success();
        return Redirect()->route('minor.group.index');

    }




    public function edit(Request $request, $id)
    {

        $minor_group = minor_group_id::findOrFail($id);

        return view('backend.product.minor_group.edit', compact('minor_group'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $minor_group = minor_group_id::findOrFail($id);

        $minor_group->name = $request->name;
        $minor_group->type = $request->type;
        $minor_group->meta = $request->meta;
        $minor_group->icon = $request->icon;

        if ($request->slug != null) {
            $minor_group->slug = preg_replace('/[^A-Za-z0-9\-]/', '', str_replace(' ', '-', $request->slug));
        }
        else {
            $minor_group->slug = preg_replace('/[^A-Za-z0-9\-]/', '', str_replace(' ', '-', $request->name)).'-'.Str::random(5);
        }
        $minor_group->save();

        flash(translate('Dosage Form has been updated successfully'))->success();
        return Redirect()->route('minor.group.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
      minor_group_id::findOrFail($id)->delete();


        flash(translate('Dosage Form has been deleted successfully'))->success();
        return redirect()->route('minor.group.index');
    }
}
