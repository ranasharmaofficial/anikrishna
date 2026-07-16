							@forelse($approvedProperties as $val)

								@php
									$firstImage = $val->images->first();
									$photoCount = $val->images->count();
									$videoCount = $val->videos->count();
								@endphp

								<article class="rtp-property-card ar1">
									<div class="rtp-prop-image-box">

										<span class="rtp-photo-badge">
											{{ $photoCount }}+ Photos
										</span>
										@if($videoCount > 0)
											<span class="rtp-photo-badge" style="left:auto;right:10px;">
												{{ $videoCount }} Video
											</span>
										@endif

										@if($firstImage)
											<img src="{{ static_asset('uploads/all/'.$firstImage->image) }}"
												 alt="{{ $val->property_title ?? 'Property Image' }}"
												 class="rtp-prop-img">
										@else
											<img src="{{ asset('assets/images/no-image.png') }}"
												 alt="No Image"
												 class="rtp-prop-img">
										@endif

										<span class="rtp-posted-time">
											Posted: {{ \Carbon\Carbon::parse($val->created_at)->diffForHumans() }}
										</span>

									</div>

									<div class="rtp-prop-details">
										<div class="rtp-prop-header">
											<div class="rtp-prop-title-row">
												<h3 class="rtp-prop-title">
													{{ $val->property_title }}
												</h3>

												<div class="rtp-action-icons">
													<span class="rtp-icon-heart" title="Wishlist">♡</span>
													<span class="rtp-icon-share" title="Share">➦</span>
												</div>
											</div>

											<a href="#" class="rtp-prop-locality">
												{{ $val->locality }},
												{{ $val->block_name }},
												{{ $val->district_name }},
												{{ $val->state_name }}
												- {{ $val->pincode }}
											</a>
										</div>

										<div class="rtp-features-row">
											<div class="rtp-feature-item">
												<span class="rtp-feat-label">CARPET AREA</span>
												<span class="rtp-feat-value">
													{{ $val->carpet_area ?? 'N/A' }} sqft
												</span>
											</div>

											<div class="rtp-feature-item">
												<span class="rtp-feat-label">STATUS</span>
												<span class="rtp-feat-value">
													{{ $val->availability_status ?? 'Available' }}
												</span>
											</div>

											<div class="rtp-feature-item">
												<span class="rtp-feat-label">FLOOR</span>
												<span class="rtp-feat-value">
													{{ $val->floor ?? 'N/A' }}
												</span>
											</div>
										</div>
									</div>

									<div class="rtp-prop-pricing">
										<div class="rtp-price-meta">
											<h2 class="rtp-price-amount">
												₹ {{ $val->price }}
												<span class="rtp-info-bubble">i</span>
											</h2>
										</div>

										<div class="rtp-action-buttons">
											<button type="button" class="rtp-btn-primary">
												Contact Owner
											</button>

											<button type="button" class="rtp-btn-secondary">
												Get Phone No.
											</button>

											<a href="{{ url('property/'.$val->property_slug) }}" class="rtp-link-extra">
												View Details
											</a>
										</div>
									</div>
								</article>

							@empty
							
								<div class="alert alert-warning">
									No Property Found
								</div>

							@endforelse
