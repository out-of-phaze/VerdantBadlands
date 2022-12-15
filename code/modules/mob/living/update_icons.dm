//IMPORTANT: Multiple animate() calls do not stack well, so try to do them all at once if you can.
/mob/living/update_transform()
	var/matrix/ntransform = matrix(transform) //aka transform.Copy()
	var/final_pixel_y = pixel_y
	var/changed = 0

	// These are one axis only, so must be done before we apply lying.
	if(resize_x != RESIZE_DEFAULT_SIZE)
		changed++
		ntransform.Scale(resize_x, 1)
		resize_x = RESIZE_DEFAULT_SIZE
	if(resize_y != RESIZE_DEFAULT_SIZE)
		changed++
		ntransform.Scale(1, resize_y)
		resize_y = RESIZE_DEFAULT_SIZE

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
		resize = RESIZE_DEFAULT_SIZE

	if(changed)
		animate(src, transform = ntransform, time = 2, pixel_y = final_pixel_y, easing = EASE_IN|EASE_OUT)
		floating_need_update = TRUE
