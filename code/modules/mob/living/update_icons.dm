//IMPORTANT: Multiple animate() calls do not stack well, so try to do them all at once if you can.
/mob/living/update_transform(do_animate = TRUE)
	var/matrix/ntransform = matrix(transform) //aka transform.Copy()
	var/final_pixel_y = pixel_y
	var/changed = 0
	if(lying != lying_prev && rotate_on_lying)
		changed++
		ntransform.TurnTo(lying_prev,lying)
		if(lying == 0) //Lying to standing
			final_pixel_y = get_standard_pixel_y_offset()
		else //if(lying != 0)
			if(lying_prev == 0) //Standing to lying
				pixel_y = get_standard_pixel_y_offset()
				final_pixel_y = get_standard_pixel_y_offset(lying)
				if(dir & (EAST|WEST)) //Facing east or west
					setDir(pick(NORTH, SOUTH)) //So you fall on your side rather than your face or ass

	if(resize != RESIZE_DEFAULT_SIZE)
		changed++
		ntransform.Scale(resize)
		if(lying && rotate_on_lying)
			ntransform.Translate(lying == 90 ? 16*(resize-1) : -(16*(resize-1)), 0)
		else
			ntransform.Translate(0, 16*(resize-1))
		resize = RESIZE_DEFAULT_SIZE

	if(changed)
		if(do_animate)
			animate(src, transform = ntransform, time = 2, pixel_y = final_pixel_y, easing = EASE_IN|EASE_OUT, flags = ANIMATION_PARALLEL)
		else
			transform = ntransform
			pixel_y = final_pixel_y
		floating_need_update = TRUE
