--Add primary keys
-- ALTER TABLE observation
-- ADD PRIMARY KEY (global_unique_identifier);

-- ALTER TABLE submission
-- ADD PRIMARY KEY (sampling_event_identifier);

-- ALTER TABLE location
-- ADD PRIMARY KEY (locality_id);

-- ALTER TABLE taxon
-- ADD PRIMARY KEY (common_name);

--Add foreign keys
ALTER TABLE submission ADD CONSTRAINT sub_loc FOREIGN KEY (locality_id) REFERENCES location (locality_id);

ALTER TABLE observation ADD CONSTRAINT obs_taxon FOREIGN KEY (common_name) REFERENCES taxon (common_name);

ALTER TABLE observation ADD CONSTRAINT obs_sub FOREIGN KEY (sampling_event_identifier) REFERENCES submission (sampling_event_identifier);
