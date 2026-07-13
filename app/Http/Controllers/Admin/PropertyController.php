<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Repositories\Interfaces\PropertyRepositoryInterface;
use App\Models\MasterProperty;
use App\Models\PropertyFeature;
use App\Models\Property;
use App\Models\PropertyEnquiry;
use App\Models\PropertyFeatureValue;
use App\Models\PropertyImage;
use App\Models\PropertyTour;
use App\Models\MasterPrice;
use App\Http\Controllers\Concerns\EditsProperties;

use Yajra\DataTables\Facades\DataTables;
class PropertyController extends Controller
{
    use EditsProperties;
    private $propertyRepository;

    public function __construct(PropertyRepositoryInterface $propertyRepository){
        $this->propertyRepository = $propertyRepository;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function propertyTypeList(Request $request){
        $property_list = $this->propertyRepository->allPropertTypes($request);
        $biharId = 1;
        return view('admin.master.property.index', compact('property_list', 'request', 'biharId'));
    }

    public function getPropertyTypes(Request $request)
    {
        if ($request->ajax()) {
            $data = MasterProperty::select(['*']);

            // if ($request->district_id) {
            //     $data->where('blocks.district_id', $request->district_id);
            // }

            // if ($request->state_id) {
            //     $data->where('state_id', $request->state_id);
            // }

            // if ($request->district_id) {
                // $data->where('district_id', $request->district_id);
            // }

            return DataTables::of($data)
                ->addIndexColumn()
                ->addColumn('status', function ($row) {
                    $checked = $row->status ? 'checked' : '';
                    return '<div class="form-check form-switch">
                                <input class="form-check-input toggle-status" data-id="'.$row->id.'" '.$checked.' type="checkbox" role="switch">
                            </div>';
                })
                ->addColumn('action', function($row){
                    return '<button class="btn btn-primary btn-sm editBtn"
                                data-id="'.$row->id.'"
                                data-name="'.$row->name.'"
                                data-status="'.$row->status.'">
                                Edit
                            </button>';
                })
                ->filter(function ($query) use ($request) {
                    if ($request->search['value']) {
                        $search = strtolower($request->search['value']);
                        $query->where(function($q) use ($search) {
                            $q->whereRaw('LOWER(name) LIKE ?', ["%{$search}%"]);
                            // ->orWhereRaw('LOWER(name) LIKE ?', ["%{$search}%"]);
                        });
                    }
                })
                ->rawColumns(['status', 'action'])
                ->make(true);
        }
    }

    public function updatePropertyType(Request $request)
    {
        $property = MasterProperty::find($request->id);
        if ($property) {
            $property->name = $request->name;
            $property->status = $request->status ? 1 : 0;
            $property->save();
            return response()->json(['success' => true]);
        }

        return response()->json(['success' => false], 404);
    }

    public function storePropertyType (Request $request){
        $request->validate([
            'name' => 'required|string|max:255',
            // 'name' => 'required|string|unique:master_properties,name|max:255',
            //'district_id' => 'required|exists:districts,id',
        ]);

        $checkNameInserted = MasterProperty::where('name', $request->name)->first();
        if ($checkNameInserted) {
            return response()->json(['status' => false, 'message' => 'Property type with this name already exists.']);
        }else{
            MasterProperty::create([
                'name' => $request->name,
                'created_by' => session('LoggedUser')->id,
                'status' => $request->status ? 1 : 0,
            ]);

            return response()->json(['status' => true]);
        }

    }

    public function toggleBlockStatus(Request $request)
    {
        $state = MasterProperty::find($request->id);
        $state->status = $request->status;
        $state->save();

        return response()->json(['success' => true]);
    }



    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(){
        $categories =  $this->locationRepository->getCmsPageList();
        return view('admin.speciality.create', compact('categories'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request){
        $data = $request->validate([
            'name' => 'required|string|max:255|unique:specialities,name',
            'status' => 'required',
            'icons' => 'required',
        ]);

        $data['created_by'] = session('LoggedUser')->id;
        if($request->has('icons')){
            $name = $request->icons->getClientOriginalName();
            $imageName = time().rand(1,999).'.'.$name;
            $request->icons->move(public_path('uploads/speciality'), $imageName);
            $data['icons'] = $imageName;
        }else{
            $data['icons'] = NULL;
        }
        $speciality_store = $this->locationRepository->storeSpeciality($request, $data);

        if (!$speciality_store) {
            return response()->json([
                "status" => false,
                "message" => 'Something went wrong',
            ]);
        } else {
            return response()->json([
                "status" => true,
                "message" => 'Successfully Added.',
            ]);

        }
        // return redirect()->route('admin.pages.index')->with(session()->flash('alert-success', 'CmsPage Created Successfully'));
    }

    /**
     * Display the specified resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function show($id){
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function edit($id){
        $data = $this->locationRepository->findSpeciality($id);
        if($data){
           return view('admin.speciality.update', compact('data'));
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id){
        // dd($id);
        $data = $request->validate([
            'name' => 'required|string|max:255|unique:specialities,name,' . $id,
            'status' => 'required'
        ]);

        $data['updated_by'] = session('LoggedUser')->id;
        if($request->has('icons')){
            $name = $request->icons->getClientOriginalName();
            $imageName = time().rand(1,999).'.'.$name;
            $request->icons->move(public_path('uploads/speciality'), $imageName);
            $data['icons'] = $imageName;
        }else{
            $data['icons'] = NULL;
        }
        $speciality_update = $this->locationRepository->updateSpeciality($data, $id);

        if (!$speciality_update) {
            return response()->json([
                "status" => false,
                "message" => 'Something went wrong',
            ]);
        } else {
            return response()->json([
                "status" => true,
                "message" => 'Successfully Updated.',
            ]);

        }
        // return redirect()->route('admin.pages.index')->with(session()->flash('alert-success', 'CmsPage Updated Successfully'));
    }

    public function propertyFeaturesList(Request $request){
        $master_property = $this->propertyRepository->allPropertTypes();

        $query = PropertyFeature::select([
            'property_features.*',
            'master_properties.name as property_type_name',
        ])->join('master_properties', 'master_properties.id', '=', 'property_features.property_type');

        if ($request->property_type) {
            $query->where('property_features.property_type', $request->property_type);
        }

        if ($request->search) {
            $search = $request->search;
            $query->where(function ($q) use ($search) {
                $q->where('property_features.label', 'like', "%$search%")
                    ->orWhere('property_features.field_name', 'like', "%$search%");
            });
        }

        $property_features = $query->paginate(20);

        return view('admin.property.property_features_list', compact('master_property', 'property_features'));
    }

    public function fetchPropertyFeatures(Request $request)
    {
        $query = PropertyFeature::select([
            'property_features.*',
            'master_properties.name as property_type_name',
        ])->join('master_properties', 'master_properties.id', '=', 'property_features.property_type');

        if ($request->property_type) {
            $query->where('property_features.property_type', $request->property_type);
        }

        if ($request->search) {
            $search = $request->search;
            $query->where(function ($q) use ($search) {
                $q->where('property_features.label', 'like', "%$search%")
                    ->orWhere('property_features.field_name', 'like', "%$search%");
            });
        }

        $property_features = $query->paginate(20);

        if ($request->ajax()) {
            return view('admin.staffs.partials.user_table', compact('property_features'))->render();
        }
    }

    public function editPropertyFeatures($id){
        $master_property = $this->propertyRepository->allPropertTypes();
        $property_feature = PropertyFeature::find($id);
        return view('admin.property.edit_property_features', compact('master_property', 'property_feature'));
    }

    public function addPropertyFeatures(){
        $master_property = $this->propertyRepository->allPropertTypes();
        return view('admin.property.add_property_features', compact('master_property'));
    }

    public function storePropertyFeatures(Request $request){
        $request->validate([
            'property_type'         => 'required|exists:master_properties,id',
            'label'                 => 'required|string|max:255',
            'field_name'            => 'required|string|max:255|unique:property_features,field_name',
            'field_type'            => 'required|string',
            'placeholder'           => 'nullable|string|max:255',
            'options'               => 'nullable|string',
            'is_required'           => 'required|boolean',
            'status'                => 'required|boolean',
        ]);

        $options = null;

        if(in_array($request->field_type, ['select','radio','checkbox']))
        {
            $options = json_encode(
                array_map('trim', explode(',', $request->options))
            );
        }

        PropertyFeature::create([
            'property_type' => $request->property_type,
            'label'         => $request->label,
            'field_name'    => strtolower(str_replace(' ', '_', $request->field_name)),
            'field_type'    => $request->field_type,
            'placeholder'   => $request->placeholder,
            'options'       => $options,
            'is_required'   => $request->is_required,
            'status'        => $request->status,
        ]);

        return response()->json([
            "status" => true,
            "message" => "Property feature added successfully.",
        ]);
    }

    public function updatePropertyFeatures(Request $request, $id){
        $request->validate([
            'property_type'         => 'required|exists:master_properties,id',
            'label'                 => 'required|string|max:255',
            'field_name'            => 'required|string|max:255|unique:property_features,field_name,' . $id,
            'field_type'            => 'required|string',
            'placeholder'           => 'nullable|string|max:255',
            'options'               => 'nullable|string',
            'is_required'           => 'required|boolean',
            'status'                => 'required|boolean',
        ]);

        $options = null;

        if(in_array($request->field_type, ['select','radio','checkbox']))
        {
            $options = json_encode(
                array_map('trim', explode(',', $request->options))
            );
        }

        $property_feature = PropertyFeature::find($request->id);
        if ($property_feature) {
            $property_feature->property_type = $request->property_type;
            $property_feature->label = $request->label;
            $property_feature->field_name = strtolower(str_replace(' ', '_', $request->field_name));
            $property_feature->field_type = $request->field_type;
            $property_feature->placeholder = $request->placeholder;
            $property_feature->options = $options;
            $property_feature->is_required = $request->is_required;
            $property_feature->status = $request->status;
            $property_feature->save();

            return response()->json([
                "status" => true,
                "message" => "Property feature updated successfully.",
            ]);
        }

        return response()->json([
            "status" => false,
            "message" => "Property feature not found.",
        ], 404);


    }

	public function upcomingPropertyList(Request $request){
        $master_property = $this->propertyRepository->allPropertTypes();

        $query = Property::select([
            'properties.*',
			'users.first_name as cust_name',
            'users.mobile as cust_mobile',
            'users.email as cust_email',
            'master_properties.name as property_type_name',
            'states.name as state_name',
            'districts.name as district_name',
            'blocks.name as block_name',
            'master_prices.price_range as price',
            'user_types.name as user_type',
        ])->join('users', 'users.id', '=', 'properties.user_id')
		  ->leftJoin('user_types', 'user_types.id', '=', 'properties.user_type')
		  ->leftJoin('master_properties', 'master_properties.id', '=', 'properties.property_type_id')
		  ->leftJoin('states', 'states.id', '=', 'properties.state_id')
		  ->leftJoin('districts', 'districts.id', '=', 'properties.city_id')
		  ->leftJoin('blocks', 'blocks.id', '=', 'properties.block_id')
		  ->leftJoin('master_prices', 'master_prices.id', '=', 'properties.price');

        if ($request->property_type) {
            $query->where('properties.property_type', $request->property_type);
        }

        if ($request->search) {
            $search = $request->search;
            $query->where(function ($q) use ($search) {
                $q->where('property_features.label', 'like', "%$search%")
                    ->orWhere('property_features.field_name', 'like', "%$search%");
            });
        }

        $upcoming_property_list = $query->paginate(20);

        return view('admin.property.upcoming_property.upcoming_property_list', compact('master_property', 'upcoming_property_list'));
    }

    public function fetchupcomingPropertyList(Request $request)
    {
        $query = Property::select([
            'properties.*',
			'users.first_name as cust_name',
            'users.mobile as cust_mobile',
            'users.email as cust_email',
            'master_properties.name as property_type_name',
            'states.name as state_name',
            'districts.name as district_name',
            'blocks.name as block_name',
            'master_prices.price_range as price',
            'user_types.name as user_type',
        ])->join('users', 'users.id', '=', 'properties.user_id')
		  ->leftJoin('user_types', 'user_types.id', '=', 'properties.user_type')
		  ->leftJoin('master_properties', 'master_properties.id', '=', 'properties.property_type_id')
		  ->leftJoin('states', 'states.id', '=', 'properties.state_id')
		  ->leftJoin('districts', 'districts.id', '=', 'properties.city_id')
		  ->leftJoin('blocks', 'blocks.id', '=', 'properties.block_id')
		  ->leftJoin('master_prices', 'master_prices.id', '=', 'properties.price');

        if ($request->property_type) {
            $query->where('properties.property_type', $request->property_type);
        }

        if ($request->search) {
            $search = $request->search;
            $query->where(function ($q) use ($search) {
                $q->where('property_features.label', 'like', "%$search%")
                    ->orWhere('property_features.field_name', 'like', "%$search%");
            });
        }

        $upcoming_property_list = $query->paginate(20);

        if ($request->ajax()) {
            return view('admin.property.upcoming_property.upcoming_property_table_ajax', compact('upcoming_property_list'))->render();
        }
    }

    public function approvedPropertyList(Request $request){
        $master_property = $this->propertyRepository->allPropertTypes();

        $query = Property::where('properties.status', 1)->select([
            'properties.*',
			'users.first_name as cust_name',
            'users.mobile as cust_mobile',
            'users.email as cust_email',
            'master_properties.name as property_type_name',
            'states.name as state_name',
            'districts.name as district_name',
            'blocks.name as block_name',
            'master_prices.price_range as price',
            'user_types.name as user_type',
        ])->join('users', 'users.id', '=', 'properties.user_id')
		  ->leftJoin('user_types', 'user_types.id', '=', 'properties.user_type')
		  ->leftJoin('master_properties', 'master_properties.id', '=', 'properties.property_type_id')
		  ->leftJoin('states', 'states.id', '=', 'properties.state_id')
		  ->leftJoin('districts', 'districts.id', '=', 'properties.city_id')
		  ->leftJoin('blocks', 'blocks.id', '=', 'properties.block_id')
		  ->leftJoin('master_prices', 'master_prices.id', '=', 'properties.price');

        if ($request->property_type) {
            $query->where('properties.property_type', $request->property_type);
        }

        if ($request->search) {
            $search = $request->search;
            $query->where(function ($q) use ($search) {
                $q->where('property_features.label', 'like', "%$search%")
                    ->orWhere('property_features.field_name', 'like', "%$search%");
            });
        }

        $upcoming_property_list = $query->paginate(20);

        return view('admin.property.approved_property.approved_property_list', compact('master_property', 'upcoming_property_list'));
    }

    public function fetchapprovedPropertyList(Request $request)
    {
        $query = Property::where('properties.status', 1)->select([
            'properties.*',
			'users.first_name as cust_name',
            'users.mobile as cust_mobile',
            'users.email as cust_email',
            'master_properties.name as property_type_name',
            'states.name as state_name',
            'districts.name as district_name',
            'blocks.name as block_name',
            'master_prices.price_range as price',
            'user_types.name as user_type',
        ])->join('users', 'users.id', '=', 'properties.user_id')
		  ->leftJoin('user_types', 'user_types.id', '=', 'properties.user_type')
		  ->leftJoin('master_properties', 'master_properties.id', '=', 'properties.property_type_id')
		  ->leftJoin('states', 'states.id', '=', 'properties.state_id')
		  ->leftJoin('districts', 'districts.id', '=', 'properties.city_id')
		  ->leftJoin('blocks', 'blocks.id', '=', 'properties.block_id')
		  ->leftJoin('master_prices', 'master_prices.id', '=', 'properties.price');

        if ($request->property_type) {
            $query->where('properties.property_type', $request->property_type);
        }

        if ($request->search) {
            $search = $request->search;
            $query->where(function ($q) use ($search) {
                $q->where('property_features.label', 'like', "%$search%")
                    ->orWhere('property_features.field_name', 'like', "%$search%");
            });
        }

        $upcoming_property_list = $query->paginate(20);

        if ($request->ajax()) {
            return view('admin.property.approved_property.approved_property_table_ajax', compact('upcoming_property_list'))->render();
        }
    }

    public function propertyEnquiryList(Request $request)
    {
        $enquiries = PropertyEnquiry::query()
            ->select('property_enquiries.*', 'properties.property_title', 'properties.property_slug')
            ->leftJoin('properties', 'properties.id', '=', 'property_enquiries.property_id')
            ->when($request->search, function ($query, $search) {
                $query->where(function ($query) use ($search) {
                    $query->where('property_enquiries.name', 'like', "%{$search}%")
                        ->orWhere('property_enquiries.mobile', 'like', "%{$search}%")
                        ->orWhere('property_enquiries.email', 'like', "%{$search}%")
                        ->orWhere('properties.property_title', 'like', "%{$search}%");
                });
            })
            ->latest('property_enquiries.created_at')
            ->paginate(20)
            ->withQueryString();

        return view('admin.property.leads.index', [
            'records' => $enquiries,
            'pageTitle' => 'Property Enquiries',
            'recordType' => 'enquiry',
        ]);
    }

    public function propertyTourList(Request $request)
    {
        $tours = PropertyTour::query()
            ->select('property_tours.*', 'properties.property_title', 'properties.property_slug')
            ->leftJoin('properties', 'properties.id', '=', 'property_tours.property_id')
            ->when($request->search, function ($query, $search) {
                $query->where(function ($query) use ($search) {
                    $query->where('property_tours.name', 'like', "%{$search}%")
                        ->orWhere('property_tours.mobile', 'like', "%{$search}%")
                        ->orWhere('property_tours.email', 'like', "%{$search}%")
                        ->orWhere('properties.property_title', 'like', "%{$search}%");
                });
            })
            ->latest('property_tours.created_at')
            ->paginate(20)
            ->withQueryString();

        return view('admin.property.leads.index', [
            'records' => $tours,
            'pageTitle' => 'Property Tours',
            'recordType' => 'tour',
        ]);
    }

    /** view property details */

    public function viewPropertyDetails($id){
        $property = $this->propertyRepository->viewPropertyDetails($id);
        // dd($property);
        return view('admin.property.view_property_details', compact('property'));
    }

    public function editProperty($id)
    {
        $property = Property::findOrFail($id);
        return view('admin.property.edit_property', $this->propertyEditData($property));
    }

    public function updateProperty(Request $request, $id)
    {
        $property = Property::findOrFail($id);
        $this->updatePropertyRecord($request, $property, true);

        return redirect()->route('admin.viewPropertyDetails', $property->id)
            ->with('alert-success', 'Property updated successfully.');
    }

    public function updatePropertyStatus(Request $request){
        $update_property  = Property::where('id', $request->id)->first();
        $update_property->status = $request->status;
        $update_property->save();
        return redirect()->back()->with(session()->flash('alert-success', 'Updated Successfully'));
    }

    public function deletePropertyDetails($id){
        $property = $this->propertyRepository->deletePropertyDetails($id);
        return redirect()->back()->with(session()->flash('alert-danger', 'Deleted Successfully'));
    }

    public function setPropertyPrice(Request $request){
        $states =  $this->propertyRepository->getPrices($request);
        return view('admin.property.price.index', compact('states', 'request'));
    }

    public function addMasterPrice(){
       return view('admin.property.price.create');
    }

    // public function cities(Request $request){
    //     $states =  $this->locationRepository->allStates($request);
    //     $biharId = 1;
    //     return view('admin.location.city.index', compact('states', 'request', 'biharId'));
    // }


    public function getMasterPrices(Request $request)
    {
        if ($request->ajax()) {
            $data = MasterPrice::select(['id', 'price_range', 'status'])->latest();
            return DataTables::of($data)
                ->addIndexColumn()
                ->addColumn('status', function ($row) {
                    $checked = $row->status ? 'checked' : '';
                    // return '<input type="checkbox" class="toggle-status" data-id="'.$row->id.'" '.$checked.'>';
                    return '<div class="form-check form-switch">
                                <input class="form-check-input toggle-status" data-id="'.$row->id.'" '.$checked.' type="checkbox" role="switch" id="switchCheckChecked">

                            </div>';
                })
                ->addColumn('action', function($row){
                    return '<button class="btn btn-primary btn-sm editBtn"
                                data-id="'.$row->id.'"
                                data-price_range="'.$row->price_range.'"
                                data-status="'.$row->status.'">
                                Edit
                            </button>';
                })
                ->rawColumns(['status', 'action'])
                ->make(true);
        }
    }

    public function storeMasterPrice(Request $request){

        // dd($request->all());
        $master_price = new MasterPrice();
        $master_price->price_range = $request->price_range;
        $master_price->status = 1;
        $master_price->save();

        // return redirect()->back()->with(session()->flash('alert-success', 'Added Successfully'));
        return response()->json(['success' => true, 'message' => 'Added Successfully']);
    }

    public function updateMasterPrice(Request $request){
        $mp = MasterPrice::find($request->id);
        if ($mp) {
            $mp->price_range = $request->price_range;
            $mp->status = $request->status ? 1 : 0;
            $mp->save();
            return response()->json(['success' => true]);
        }

        return response()->json(['success' => false], 404);
    }


}
