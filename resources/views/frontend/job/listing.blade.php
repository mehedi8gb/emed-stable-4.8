@extends('frontend.layouts.app')

@section('content')
<style type="text/css">
    div.card {
    background           : linear-gradient(to right, rgba(255, 253, 231, 1) 0%, rgba(255, 253, 231, 1) 40%, rgba(255, 255, 255, 1) 75%, rgba(255, 255, 255, 1) 100%);
    background-image     : linear-gradient(to right, rgb(255, 253, 231) 0%, rgb(255, 253, 231) 40%, rgb(255, 255, 255) 75%, rgb(255, 255, 255) 100%);
    background-position-x: initial;
    background-position-y: initial;
    background-size      : initial;
    background-repeat-x  : initial;
    background-repeat-y  : initial;
    background-attachment: initial;
    background-origin    : initial;
    background-clip      : initial;
    background-color     : initial;
    border-redius        : 15px;
    }
    div.sout-jobs-wrapper {
     border       : 1px solid #d5d5d5;
     cursor       : pointer;
     padding      : 5px 18px 15px 10px;
     margin       : 5px 0px 5px 0px;
     color        : #656565;
     border-radius: 8px;
     background   : rgb(202, 201, 186);
     background   : -moz-linear-gradient(left, rgba(255, 253, 231, 1) 0%, rgba(255, 253, 231, 1) 40%, rgba(255, 255, 255, 1) 75%, rgba(255, 255, 255, 1) 100%);
     background   : -webkit-linear-gradient(left, rgba(255, 253, 231, 1) 0%, rgba(255, 253, 231, 1) 40%, rgba(255, 255, 255, 1) 75%, rgba(255, 255, 255, 1) 100%);
     background   : linear-gradient(to right, rgba(255, 253, 231, 1) 0%, rgba(255, 253, 231, 1) 40%, rgba(255, 255, 255, 1) 75%, rgba(255, 255, 255, 1) 100%);
     filter       : progid: DXImageTransform.Microsoft.gradient( startColorstr='#fffde7', endColorstr='#ffffff', GradientType=1);
    }

    div.sout-jobs-wrapper:hover {
    cursor            : pointer;
    background        : rgb(250, 248, 226);
    background        : -moz-linear-gradient(left, rgba(250, 248, 226, 1) 0%, rgba(250, 248, 226, 1) 40%, rgba(255, 255, 255, 1) 75%, rgba(255, 255, 255, 1) 100%);
    background        : -webkit-linear-gradient(left, rgba(250, 248, 226, 1) 0%, rgba(250, 248, 226, 1) 40%, rgba(255, 255, 255, 1) 75%, rgba(255, 255, 255, 1) 100%);
    background        : linear-gradient(to right, rgba(250, 248, 226, 1) 0%, rgba(250, 248, 226, 1) 40%, rgba(255, 255, 255, 1) 75%, rgba(255, 255, 255, 1) 100%);
    filter            : progid: DXImageTransform.Microsoft.gradient( startColorstr='#faf8e2', endColorstr='#ffffff', GradientType=1);
    -webkit-box-shadow: 0px 3px 6px rgba(34, 28, 28, 0.11);
    -moz-box-shadow   : 0px 3px 6px rgba(0, 0, 0, 0.16);
    box-shadow        : 0px 3px 6px rgb(0 0 0 / 30%);
}



.popover-item{
  position: relative;
}
.popover-content{
  display:none;
  position: absolute;
  left: 105%;
  display: none;
  font-size: 1.2rem;
  background-color: rgba(230, 230, 230, 1);
  padding: 10px 20px;
  border-radius: 16px;
  font-family: Tahoma, Verdana, Segoe, sans-serif;
  font-weight: normal;
  z-index:111;
  width:300px;
}
.popover-content:hover{
  display:none!important;
}
.popover-item:hover .popover-content{
  display: block;
}
.popover-content h1{
  font-size:20px;
}
</style>
<section class = "pt-4 mb-4">
<div     class = "container text-center">
<div     class = "row">
<div  style="margin-bottom: -26px;"   class = "col-lg-12 text-center text-lg-left">
<span  style="padding: 10px;"     class = "fw-600 h4 card">{{ translate('All Circulers')}}</span><hr>
            </div>
            {{-- <div class = "col-lg-6">
            <ul  class = "breadcrumb bg-transparent p-0 justify-content-center justify-content-lg-end">
            <li  class = "breadcrumb-item opacity-50">
            <a   class = "text-reset" href = "{{ route('home') }}">
                            {{ translate('Home')}}
                        </a>
                    </li>
                    <li class = "text-dark fw-600 breadcrumb-item">
                    <a  class = "text-reset" href = "{{ route('front.job') }}">
                            "{{ translate('Circulers') }}"
                        </a>
                    </li>
                </ul>
            </div> --}}
        </div>
    </div>
</section>
<section class = "pb-4">
<div     class = "container">

{{--

  <div class="row">
    <div class="col-md-3 popover-item">
      Cell 1
      <div class="popover-content">
        <h1>Cell 1 - Tooltip/Popover</h1>
        <p>This is a Tooltip/Popover following the mouse pointer on hover</p>
      </div>
    </div>
    <div class="col-md-3 popover-item">
      Cell 2
      <div class="popover-content">
        <h1>Cell 2 - Tooltip/Popover</h1>
        <p>This is a Tooltip/Popover following the mouse pointer on hover</p>
      </div>
    </div>
</div>

<script type="">




	var boxHovered, boxNumber, selector, targetedBox, adjustX, adjustY;
	$(".popup").hide();//This hides all the pop-ups when page loads
	$(".box").hover(function(){//This executes when you hover ON the box
		 boxHovered = $(this).attr("id");//Gets the id of the box such as "box1", "box2"
		 targetedBox = "#" + boxHovered;//creates a value of "#box1", "#box2", etc for future use
		 boxNumber = boxHovered.substr(3,5);//extracts the # from the id, such as 1, 2, 3
		 selector = "#popup"+boxNumber;//creates a value of "#popup1", "#popup2", etc for future use
		 $(selector).show();//This reveals the popup inside the hovered box
		 moveBox();//This calls on the function below to execute
	},function(){//This executes when you hover OFF the box
		 $(selector).hide();//This hides the popup inside the hovered box
	});
	function moveBox(){
		$(targetedBox).bind('mousemove',function(event){//Executes when the mouse MOVES
			adjustX = $(this).find(".popup").outerWidth(true);//gets the width of the targeted popup
			adjustY = $(this).find(".popup").outerHeight(true);//gets the height of the targeted popup
			if(targetedBox == "#box1") {//example of moving popup relative to mouse
				adjustX = $(this).find(".popup").outerWidth(true)-12;//creates a more unique value
				adjustY = $(this).find(".popup").outerHeight(true)-12;
			}
			//event.pageY or evet.pageX = the mouse position relative to the top left of the targeted box
			var my = event.pageY-$(this).offset().top-adjustY;//my = mouse y position with some adjustment relateive to top of box
			var mx = event.pageX-$(this).offset().left-adjustX; //mx = mouse x position with some adjustment relateive to left of box
			$(selector).css({//set the selected popup box coordinates near the mouse as the mouse moves
				"left":mx,
				"top":my
			});
		});
</script> --}}


<div     class = "card-row ">
            @foreach($jobs as $job)
                <div class = "card sout-jobs-wrapper w-100 overflow-hidden shadow-sm style='width: 15rem; display: inline-block'">
                <a   href  = "{{ env("APP_URL")."/jobs".'/'. $job->slug }}" class = "stretched-link"></a>


                <div class="row ">
                    <div class="col-md-11 col-10">

                   <div class="m-2">     @if($job->category != null)
                    <div class = "mb-2 opacity-70">
                        <span>{{ $job->category->category_name }}</span>
                    </div>
                    @endif
                    <h2 class = "fs-18 fw-600 mb-2">
                    <a  href  = "{{ url("jobs").'/'. $job->slug }}" class = "text-reset">
                            {{ $job->job_title }}
                        </a>
                    </h2></div>
                    </div>
                    <div class="col-md-1 col-2">
                        <a   href     = "{{ env("APP_URL")."jobs".'/'. $job->slug }}" class = "text-reset d-block">
                            <img style    = "float: right;  margin: 12px"
                                 src      = "{{ static_asset('assets/') }}"
                                 data-src = "{{ uploaded_asset($job->banner) }}"
                                 alt      = "{{ $job->title }}"
                                 class    = "img-fluid lazyload "
                                >
                            </a>
                    </div>
                </div>
                <hr>
                    <div class    = "p-4">


                        <div class = "mb-2 opacity-72">
                            <span>{{ $job->company }}</span>
                        </div>
                        <div class = "mb-1 opacity-71 ">

                            <span> <i class = "las la-map-marker"></i>
                                @if ($job->location_id != null)
                                {{$job->location->location}}
                                    @else
                                    NA
                                @endif</span>
                        </div>
                        <div class = "mb-1 opacity-72">
                        <i   class = "las la-university"></i>
                            <span>{{ $job->education }}</span>
                        </div>
                        <div>
                        <p class = "opacity-72 mb-2">
                        <i class = "las la-briefcase"></i>
                            {{ $job->experience }}
                        </p>
                        <div  style="line-height: 16px; color: #fd6a26" class="d-none d-md-block d-sm-none float-right fs-14 fw-700">
                        Deadline: <br>
                            {{  Carbon\Carbon::parse($job->deadline)->format('d D M Y')  }}
                        </div>
                        </div>
                        <div>
                            <p class = "opacity-95 mb-4">
                               <b> {{ $job->short_description }} </b>
                            </p>

                        </div>
                        <div  style="line-height: 16px; color: #fd6a26" class="d-block d-md-none d-lg-none d-xl-none d-sm-block d-xs-block float-right fs-14 fw-700">
                            Deadline: <br>
                                {{  Carbon\Carbon::parse($job->deadline)->format('d D M Y')  }}
                            </div>
                        {{-- <a data-html="true" data-animation="true" data-toggle="tooltip" data-placement="top" title="<i>Read Everything carefully then Mail us your application and cv</i>"
                        href = "{{ url("career").'/'. $job->slug }}" class = "btn btn-soft-primary">
                            {{ translate('View Circuler') }}
                        </a> --}}

                    </div>
                </div>
            @endforeach

        </div>
        <div class = "aiz-pagination aiz-pagination-center mt-4">
            {{ $jobs->links() }}
        </div>
    </div>
</section>
@endsection
