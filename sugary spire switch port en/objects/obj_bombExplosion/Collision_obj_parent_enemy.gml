if (image_index > 9 || !hurtBaddies)
	return

if (hurtOwner && ownerID == other.id)
	return

instance_destroy(other.id)
