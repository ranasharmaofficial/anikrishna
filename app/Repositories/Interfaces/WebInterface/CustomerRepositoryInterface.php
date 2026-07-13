<?php
namespace App\Repositories\Interfaces\WebInterface;
use Illuminate\Http\Request;

Interface CustomerRepositoryInterface{
    public function getSpecialityDoctorList($speciality_id);
    
}
