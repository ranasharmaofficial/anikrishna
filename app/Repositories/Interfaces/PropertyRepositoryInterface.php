<?php
namespace App\Repositories\Interfaces;
use Illuminate\Http\Request;

Interface PropertyRepositoryInterface{
    public function allPropertTypes();
    public function viewPropertyDetails($id);




}
